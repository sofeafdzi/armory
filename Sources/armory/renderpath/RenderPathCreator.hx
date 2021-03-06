// Reference: https://github.com/armory3d/armory_docs/blob/master/dev/renderpath.md
package armory.renderpath;

import iron.RenderPath;

class RenderPathCreator {

	public static var path:RenderPath;

	#if (rp_renderer == "Forward")
	public static var drawMeshes:Void->Void = RenderPathForward.drawMeshes;
	public static var applyConfig:Void->Void = RenderPathForward.applyConfig;
	#elseif (rp_renderer == "Deferred")
	public static var drawMeshes:Void->Void = RenderPathDeferred.drawMeshes;
	public static var applyConfig:Void->Void = RenderPathDeferred.applyConfig;
	#else
	public static var drawMeshes:Void->Void = function() {};
	public static var applyConfig:Void->Void = function() {};
	#end

	public static function get():RenderPath {
		path = new RenderPath();
		Inc.init(path);
		#if (rp_renderer == "Forward")
		RenderPathForward.init(path);
		path.commands = RenderPathForward.commands;
		#elseif (rp_renderer == "Deferred")
		RenderPathDeferred.init(path);
		path.commands = RenderPathDeferred.commands;
		#elseif (rp_renderer == "Pathtracer")
		RenderPathPathtracer.init(path);
		path.commands = RenderPathPathtracer.commands;
		#end
		return path;
	}

	#if (rp_gi != "Off")
	public static var voxelFrame = 0;
	public static var voxelFreq = 6; // Revoxelizing frequency
	#end

	// Last target before drawing to framebuffer
	public static var finalTarget:RenderTarget = null;
}
