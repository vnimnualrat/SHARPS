package cs437.model;

public class Bedroom {
	Integer userId;
	String name = "bedroom";
	Integer lightIntensity; // 0 - 100
	Integer roomTemperature;
	String tvPower;
	Integer tvVolume; // 0 - 100
	String radioPower;
	Integer radioVolume; // 0 - 100
	
	public Bedroom(Integer userId, Integer lightIntensity, Integer roomTemperature, String tvPower, Integer tvVolume, String radioPower, Integer radioVolume){
		this.userId = userId;
		this.lightIntensity = lightIntensity;
		this.roomTemperature = roomTemperature;
		this.tvPower = tvPower;
		this.tvVolume = tvVolume;
		this.radioPower = radioPower;
		this.radioVolume = radioVolume;
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
	public Integer getTvVolume() {
		return tvVolume;
	}
	public void setTvVolume(Integer tvVolume) {
		this.tvVolume = tvVolume;
	}
	public Integer getRadioVolume() {
		return radioVolume;
	}
	public void setRadioVolume(Integer radioVolume) {
		this.radioVolume = radioVolume;
	}

	public Integer getRoomTemperature() {
		return roomTemperature;
	}

	public void setRoomTemperature(Integer roomTemperature) {
		this.roomTemperature = roomTemperature;
	}

	public String getTvPower() {
		return tvPower;
	}

	public void setTvPower(String tvPower) {
		this.tvPower = tvPower;
	}

	public String getRadioPower() {
		return radioPower;
	}

	public void setRadioPower(String radioPower) {
		this.radioPower = radioPower;
	}
		
}
