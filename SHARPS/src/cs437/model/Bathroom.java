package cs437.model;

public class Bathroom {
	
	Integer userId;
	String name = "bathroom";
	Integer lightIntensity; // 0 - 100
	Integer roomTemperature; //50 - 90
	Integer waterTemperature; // 75 - 125 Fahrenheit
	String radioPower;
	Integer radioVolume; // 0 - 100
	
	public Bathroom(Integer userId, Integer lightIntensity, Integer roomTemperature, Integer waterTemperature, String radioPower, Integer radioVolume){
		this.userId = userId;
		this.lightIntensity = lightIntensity;
		this.roomTemperature = roomTemperature;
		this.waterTemperature = waterTemperature;
		this.radioPower = radioPower;
		this.radioVolume = radioVolume;
	}
	
	public Integer getRoomTemperature() {
		return roomTemperature;
	}

	public void setRoomTemperature(Integer roomTemperature) {
		this.roomTemperature = roomTemperature;
	}

	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getLightIntensity() {
		return lightIntensity;
	}
	public void setLightIntensity(Integer lightIntensity) {
		this.lightIntensity = lightIntensity;
	}
	public Integer getWaterTemperature() {
		return waterTemperature;
	}
	public void setWaterTemperature(Integer waterTemperature) {
		this.waterTemperature = waterTemperature;
	}
	public Integer getRadioVolume() {
		return radioVolume;
	}
	public void setRadioVolume(Integer radioVolume) {
		this.radioVolume = radioVolume;
	}

	public String getRadioPower() {
		return radioPower;
	}

	public void setRadioPower(String radioPower) {
		this.radioPower = radioPower;
	}
	
}
