Return-Path: <jailhouse-dev+bncBCQ7HUU4XULBBN5RY7YQKGQEFFCLJTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23d.google.com (mail-oi1-x23d.google.com [IPv6:2607:f8b0:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DD214D105
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jan 2020 20:10:49 +0100 (CET)
Received: by mail-oi1-x23d.google.com with SMTP id k206sf271273oia.22
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jan 2020 11:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OSOesq7ZBctOOMcf23lFosM8pCs12meE30GIq66fTUQ=;
        b=qgw6eCnx4n4Ups3MMKaxRwy0P93RpvZGULyUTzAqtcnqkYPc+YbISpDqcm+r46PmQk
         8ZBQ5WqTARtBKl7GZXRP1l4kTfNl3zP3AuGokDo1YB3NP1uA2P5S8LnDvUZzVhPeTtxH
         7MibjSyF+zOMFSogXQBT1PgyO4XusFllPKWbNGhtuZtazqeryzb+4SR8gNjLxAk4BlDq
         JXgdI32JobCWMwyd0xeyLdI8e8JQKuJ36MFXFmdACGMFkHGwoCycAbnEgrM4N52l37uM
         GX0gJ7GVzzrlLULyyQQdrmCLZZ1AkqD1R2NvmHr8YdlOv5GS/iVnkz7WhbeBEGrVm7dd
         eLgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OSOesq7ZBctOOMcf23lFosM8pCs12meE30GIq66fTUQ=;
        b=BYTi15Kfy3UXB9JVSxnuDKoLBaYK5g+Zq+16nJ3yZZAZW68ICutZp90i5TKyNk3Auo
         ANqHRovihrEk68or6344lpDllY81MHAamLFCFk83PvF/yG6TRwdQGVrvjoLMAQph10Xk
         6tRZqFdutbvzg+QJ9/ptNzDKiPMmzIWyrC277hgHeMUQs4erwChLpzKXQ06J8YWQTMWu
         4ARs+4NCYDuo7W9CCO8Us8N4t+GyAPLn73iS+EwiNtdXBxhoai0/ufU9SFqJJ9jcV/6l
         3vQ72SfQFIz4eglZs/0M79GaWH9QqQJxz0HQ7NK6OhFyvxbAV/HAb5O4qMbo65NhNIek
         n3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=OSOesq7ZBctOOMcf23lFosM8pCs12meE30GIq66fTUQ=;
        b=LoiIHdUr7ebxIs8NJ66SKrrfqnt+tnR4R8W17kJXSpytnMf4lnDFrjQi5rBfgKqQYR
         1R9AkGbDRSNqTL5U39VA/mzZw0n67+q2h+U8JW3rYwSmO3AmtO2vVgSBbdTJBxl/dHKm
         4Yq3xGdv8yR0QADLm4V5Rj/ETwdRqNSPb+++AuMCqnxW83/ayphZ4kTm/X2vSVMezwlZ
         1CIGqnCGyzUHFgO9Cj/sct+q/dmkaCbGEzVNuAVcGiN2bGed/hWTW7wiY2AV3wcQUR6W
         cI7+ftQhnjJqZT2JMd+SYkeAmDApu0uO8pnyCHH5hqHyxOO3kHgBExxeAlSBAh87K+Dv
         9vAQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX3IldjBXmPGhCxBCCzrnqwf490e4j/Rj/YpQKBPKOnVeHE76hc
	18JP9ap6l7K1yzmvATuvP2Y=
X-Google-Smtp-Source: APXvYqwp4KBf1GO6EOLQTYcfdH2ALJS28MGPjKZaB9ecVyspGNsJQk7pGM1K44VrHd7MhI8nGP2A6Q==
X-Received: by 2002:aca:b1d5:: with SMTP id a204mr296074oif.82.1580325048092;
        Wed, 29 Jan 2020 11:10:48 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:4a4:: with SMTP id l4ls138136otd.11.gmail; Wed, 29
 Jan 2020 11:10:47 -0800 (PST)
X-Received: by 2002:a9d:7501:: with SMTP id r1mr579029otk.307.1580325047437;
        Wed, 29 Jan 2020 11:10:47 -0800 (PST)
Date: Wed, 29 Jan 2020 11:10:46 -0800 (PST)
From: Saroj Sapkota <samirroj2016@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <499d8d12-ac16-4374-a8ec-b27cb44902a2@googlegroups.com>
In-Reply-To: <3f267078-10bf-4a5c-86df-9a2cf0d4abd4@googlegroups.com>
References: <aef00f02-8d3b-4916-aace-f30233559859@googlegroups.com>
 <6e69283d-90dd-4579-7640-c5d585a2a9ad@siemens.com>
 <73f42baf-5afe-4a77-80d1-8e4bc9419f62@googlegroups.com>
 <72876f0a-4d50-45e3-cd21-751f8bf223fb@siemens.com>
 <3f267078-10bf-4a5c-86df-9a2cf0d4abd4@googlegroups.com>
Subject: Re: mem_region_request failed for hypervisor memory in jetson-tx2
 kit
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_782_551077851.1580325046696"
X-Original-Sender: samirroj2016@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_782_551077851.1580325046696
Content-Type: multipart/alternative; 
	boundary="----=_Part_783_1622631590.1580325046696"

------=_Part_783_1622631590.1580325046696
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

here the txt file of serialconsole output


On Wednesday, January 29, 2020 at 12:52:00 PM UTC-6, Saroj Sapkota wrote:
>
> I have attached jetson-tx2.c and serial console output that is obtained=
=20
> after jailhouse enable command.
>
> On Wednesday, January 29, 2020 at 12:06:48 PM UTC-6, Jan Kiszka wrote:
>>
>> On 29.01.20 18:04, Saroj Sapkota wrote:=20
>> > I changed the extlinux as suggested by Henning schild, as=20
>> > attached file:=20
>> > and rebooted the system and checked the following:=20
>> > printenv gives:=20
>> > tx2@tx2 $ sudo printenv=20
>> > [sudo] password for tx2:=20
>> >=20
>> LS_COLORS=3Drs=3D0:di=3D01;34:ln=3D01;36:mh=3D00:pi=3D40;33:so=3D01;35:d=
o=3D01;35:bd=3D40;33;01:cd=3D40;33;01:or=3D40;31;01:mi=3D00:su=3D37;41:sg=
=3D30;43:ca=3D30;41:tw=3D30;42:ow=3D34;42:st=3D37;44:ex=3D01;32:*.tar=3D01;=
31:*.tgz=3D01;31:*.arc=3D01;31:*.arj=3D01;31:*.taz=3D01;31:*.lha=3D01;31:*.=
lz4=3D01;31:*.lzh=3D01;31:*.lzma=3D01;31:*.tlz=3D01;31:*.txz=3D01;31:*.tzo=
=3D01;31:*.t7z=3D01;31:*.zip=3D01;31:*.z=3D01;31:*.Z=3D01;31:*.dz=3D01;31:*=
.gz=3D01;31:*.lrz=3D01;31:*.lz=3D01;31:*.lzo=3D01;31:*.xz=3D01;31:*.zst=3D0=
1;31:*.tzst=3D01;31:*.bz2=3D01;31:*.bz=3D01;31:*.tbz=3D01;31:*.tbz2=3D01;31=
:*.tz=3D01;31:*.deb=3D01;31:*.rpm=3D01;31:*.jar=3D01;31:*.war=3D01;31:*.ear=
=3D01;31:*.sar=3D01;31:*.rar=3D01;31:*.alz=3D01;31:*.ace=3D01;31:*.zoo=3D01=
;31:*.cpio=3D01;31:*.7z=3D01;31:*.rz=3D01;31:*.cab=3D01;31:*.wim=3D01;31:*.=
swm=3D01;31:*.dwm=3D01;31:*.esd=3D01;31:*.jpg=3D01;35:*.jpeg=3D01;35:*.mjpg=
=3D01;35:*.mjpeg=3D01;35:*.gif=3D01;35:*.bmp=3D01;35:*.pbm=3D01;35:*.pgm=3D=
01;35:*.ppm=3D01;35:*.tga=3D01;35:*.xbm=3D01;35:*.xpm=3D01;35:*.tif=3D01;35=
:*.tiff=3D01;35:*.png=3D01;35:*.svg=3D01;35:*.svgz=3D01;35:*.mng=3D01;35:*.=
pcx=3D01;35:*.mov=3D01;35:*.mpg=3D01;35:*.mpeg=3D01;35:*.m2v=3D01;35:*.mkv=
=3D01;35:*.webm=3D01;35:*.ogm=3D01;35:*.mp4=3D01;35:*.m4v=3D01;35:*.mp4v=3D=
01;35:*.vob=3D01;35:*.qt=3D01;35:*.nuv=3D01;35:*.wmv=3D01;35:*.asf=3D01;35:=
*.rm=3D01;35:*.rmvb=3D01;35:*.flc=3D01;35:*.avi=3D01;35:*.fli=3D01;35:*.flv=
=3D01;35:*.gl=3D01;35:*.dl=3D01;35:*.xcf=3D01;35:*.xwd=3D01;35:*.yuv=3D01;3=
5:*.cgm=3D01;35:*.emf=3D01;35:*.ogv=3D01;35:*.ogx=3D01;35:*.aac=3D00;36:*.a=
u=3D00;36:*.flac=3D00;36:*.m4a=3D00;36:*.mid=3D00;36:*.midi=3D00;36:*.mka=
=3D00;36:*.mp3=3D00;36:*.mpc=3D00;36:*.ogg=3D00;36:*.ra=3D00;36:*.wav=3D00;=
36:*.oga=3D00;36:*.opus=3D00;36:*.spx=3D00;36:*.xspf=3D00;36:=20
>>
>> > LANG=3Den_US.UTF-8=20
>> > HOME=3D/home/tx2=20
>> > TERM=3Dxterm-256color=20
>> >=20
>> PATH=3D/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/sna=
p/bin=20
>> > MAIL=3D/var/mail/root=20
>> > LOGNAME=3Droot=20
>> > USER=3Droot=20
>> > USERNAME=3Droot=20
>> > SHELL=3D/bin/bash=20
>> > SUDO_COMMAND=3D/usr/bin/printenv=20
>> > SUDO_USER=3Dtx2=20
>> > SUDO_UID=3D1000=20
>> > SUDO_GID=3D1000=20
>> > Similarly output of cat /proc/cmdline is :=20
>> > root=3D/dev/mmcblk0p1 rw rootwait rootfstype=3Dext4 console=3DttyS0,11=
5200n8=20
>> > console=3Dtty0 fbcon=3Dmap:0 net.ifnames=3D0 video=3Dtegrafb=20
>> > no_console_suspend=3D1 earlycon=3Duart8250,mmio32,0x3100000=20
>> > nvdumper_reserved=3D0x2772e0000 gpt tegra_fbmem2=3D0x140000@0x9607d000=
=20
>> > lut_mem2=3D0x2008@0x9607a000 usbcore.old_scheme_first=3D1=20
>> tegraid=3D18.1.2.0.0=20
>> > maxcpus=3D6 boot.slot_suffix=3D boot.ratchetvalues=3D0.2031647.1=20
>> > bl_prof_dataptr=3D0x10000@0x275840000 sdhci_tegra.en_boot_part_access=
=3D1=20
>> > quiet mem=3D7808M vmalloc=3D512M=20
>> >=20
>> > when i again tried to enable jailhouse through command sudo jailhouse=
=20
>> > enable Downloads/linux-jetson/configs/arm64/jetson-tx2.cell=20
>> > terminal cell hangs and debug cell gives following output:=20
>>
>> We need the output on the serial console configured in jetson-tx2.c as=
=20
>> Jailhouse debug channel.=20
>>
>> Jan=20
>>
>> --=20
>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE=20
>> Corporate Competence Center Embedded Linux=20
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/499d8d12-ac16-4374-a8ec-b27cb44902a2%40googlegroups.com.

------=_Part_783_1622631590.1580325046696
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>here the txt file of serialconsole output</div><div><=
br> </div><br>On Wednesday, January 29, 2020 at 12:52:00 PM UTC-6, Saroj Sa=
pkota wrote:<blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-lef=
t: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;"><div dir=3D"ltr">I=
 have attached jetson-tx2.c and serial console output that is obtained afte=
r jailhouse enable command.<br><br>On Wednesday, January 29, 2020 at 12:06:=
48 PM UTC-6, Jan Kiszka wrote:<blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0;margin-left:0.8ex;border-left:1px #ccc solid;padding-left:1ex">On 29=
.01.20 18:04, Saroj Sapkota wrote:
<br>&gt; I changed the extlinux as suggested by Henning schild, as
<br>&gt; attached file:
<br>&gt; and rebooted the system and checked the following:
<br>&gt; printenv gives:
<br>&gt; tx2@tx2 $ sudo printenv
<br>&gt; [sudo] password for tx2:
<br>&gt; LS_COLORS=3Drs=3D0:di=3D01;34:ln=3D01;<wbr>36:mh=3D00:pi=3D40;33:s=
o=3D01;35:do=3D<wbr>01;35:bd=3D40;33;01:cd=3D40;33;01:<wbr>or=3D40;31;01:mi=
=3D00:su=3D37;41:sg=3D<wbr>30;43:ca=3D30;41:tw=3D30;42:ow=3D34;<wbr>42:st=
=3D37;44:ex=3D01;32:*.tar=3D01;<wbr>31:*.tgz=3D01;31:*.arc=3D01;31:*.<wbr>a=
rj=3D01;31:*.taz=3D01;31:*.lha=3D<wbr>01;31:*.lz4=3D01;31:*.lzh=3D01;31:<wb=
r>*.lzma=3D01;31:*.tlz=3D01;31:*.<wbr>txz=3D01;31:*.tzo=3D01;31:*.t7z=3D<wb=
r>01;31:*.zip=3D01;31:*.z=3D01;31:*.<wbr>Z=3D01;31:*.dz=3D01;31:*.gz=3D01;3=
1:<wbr>*.lrz=3D01;31:*.lz=3D01;31:*.lzo=3D<wbr>01;31:*.xz=3D01;31:*.zst=3D0=
1;31:*<wbr>.tzst=3D01;31:*.bz2=3D01;31:*.bz=3D<wbr>01;31:*.tbz=3D01;31:*.tb=
z2=3D01;<wbr>31:*.tz=3D01;31:*.deb=3D01;31:*.<wbr>rpm=3D01;31:*.jar=3D01;31=
:*.war=3D<wbr>01;31:*.ear=3D01;31:*.sar=3D01;31:<wbr>*.rar=3D01;31:*.alz=3D=
01;31:*.ace=3D<wbr>01;31:*.zoo=3D01;31:*.cpio=3D01;<wbr>31:*.7z=3D01;31:*.r=
z=3D01;31:*.<wbr>cab=3D01;31:*.wim=3D01;31:*.swm=3D<wbr>01;31:*.dwm=3D01;31=
:*.esd=3D01;31:<wbr>*.jpg=3D01;35:*.jpeg=3D01;35:*.<wbr>mjpg=3D01;35:*.mjpe=
g=3D01;35:*.<wbr>gif=3D01;35:*.bmp=3D01;35:*.pbm=3D<wbr>01;35:*.pgm=3D01;35=
:*.ppm=3D01;35:<wbr>*.tga=3D01;35:*.xbm=3D01;35:*.xpm=3D<wbr>01;35:*.tif=3D=
01;35:*.tiff=3D01;<wbr>35:*.png=3D01;35:*.svg=3D01;35:*.<wbr>svgz=3D01;35:*=
.mng=3D01;35:*.pcx=3D<wbr>01;35:*.mov=3D01;35:*.mpg=3D01;35:<wbr>*.mpeg=3D0=
1;35:*.m2v=3D01;35:*.<wbr>mkv=3D01;35:*.webm=3D01;35:*.ogm=3D<wbr>01;35:*.m=
p4=3D01;35:*.m4v=3D01;35:<wbr>*.mp4v=3D01;35:*.vob=3D01;35:*.qt=3D<wbr>01;3=
5:*.nuv=3D01;35:*.wmv=3D01;35:<wbr>*.asf=3D01;35:*.rm=3D01;35:*.rmvb=3D<wbr=
>01;35:*.flc=3D01;35:*.avi=3D01;35:<wbr>*.fli=3D01;35:*.flv=3D01;35:*.gl=3D=
<wbr>01;35:*.dl=3D01;35:*.xcf=3D01;35:*<wbr>.xwd=3D01;35:*.yuv=3D01;35:*.cg=
m=3D<wbr>01;35:*.emf=3D01;35:*.ogv=3D01;35:<wbr>*.ogx=3D01;35:*.aac=3D00;36=
:*.au=3D<wbr>00;36:*.flac=3D00;36:*.m4a=3D00;<wbr>36:*.mid=3D00;36:*.midi=
=3D00;36:*.<wbr>mka=3D00;36:*.mp3=3D00;36:*.mpc=3D<wbr>00;36:*.ogg=3D00;36:=
*.ra=3D00;36:*<wbr>.wav=3D00;36:*.oga=3D00;36:*.opus=3D<wbr>00;36:*.spx=3D0=
0;36:*.xspf=3D00;<wbr>36:
<br>&gt; LANG=3Den_US.UTF-8
<br>&gt; HOME=3D/home/tx2
<br>&gt; TERM=3Dxterm-256color
<br>&gt; PATH=3D/usr/local/sbin:/usr/<wbr>local/bin:/usr/sbin:/usr/bin:/<wb=
r>sbin:/bin:/snap/bin
<br>&gt; MAIL=3D/var/mail/root
<br>&gt; LOGNAME=3Droot
<br>&gt; USER=3Droot
<br>&gt; USERNAME=3Droot
<br>&gt; SHELL=3D/bin/bash
<br>&gt; SUDO_COMMAND=3D/usr/bin/printenv
<br>&gt; SUDO_USER=3Dtx2
<br>&gt; SUDO_UID=3D1000
<br>&gt; SUDO_GID=3D1000
<br>&gt; Similarly output of cat /proc/cmdline is :
<br>&gt; root=3D/dev/mmcblk0p1 rw rootwait rootfstype=3Dext4 console=3DttyS=
0,115200n8=20
<br>&gt; console=3Dtty0 fbcon=3Dmap:0 net.ifnames=3D0 video=3Dtegrafb=20
<br>&gt; no_console_suspend=3D1 earlycon=3Duart8250,mmio32,<wbr>0x3100000=
=20
<br>&gt; nvdumper_reserved=3D0x2772e0000 gpt tegra_fbmem2=3D0x140000@<wbr>0=
x9607d000=20
<br>&gt; lut_mem2=3D0x2008@0x9607a000 usbcore.old_scheme_first=3D1 tegraid=
=3D18.1.2.0.0=20
<br>&gt; maxcpus=3D6 boot.slot_suffix=3D boot.ratchetvalues=3D0.2031647.1=
=20
<br>&gt; bl_prof_dataptr=3D0x10000@<wbr>0x275840000 sdhci_tegra.en_boot_par=
t_<wbr>access=3D1=20
<br>&gt; quiet mem=3D7808M vmalloc=3D512M
<br>&gt;=20
<br>&gt; when i again tried to enable jailhouse through command sudo jailho=
use=20
<br>&gt; enable Downloads/linux-jetson/<wbr>configs/arm64/jetson-tx2.cell
<br>&gt; terminal cell hangs and debug cell gives following output:
<br>
<br>We need the output on the serial console configured in jetson-tx2.c as=
=20
<br>Jailhouse debug channel.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/499d8d12-ac16-4374-a8ec-b27cb44902a2%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/499d8d12-ac16-4374-a8ec-b27cb44902a2%40googlegroups.com<=
/a>.<br />

------=_Part_783_1622631590.1580325046696--

------=_Part_782_551077851.1580325046696
Content-Type: text/plain; charset=US-ASCII; name=serial_console_output.txt
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=serial_console_output.txt
X-Attachment-Id: 2e022dab-4050-4256-a823-fcf273b73504
Content-ID: <2e022dab-4050-4256-a823-fcf273b73504>

##serial console output after insmod jailhouse.ko####
##
tx2@tx2-desktop:~$ [   60.190355] jailhouse: loading out-of-tree module taints kernel.
##
##output on serial console after jailhouse enable jetson-tx2.cell command####
##
Dump for CPU4:
pid: 0  comm: swapper/4
  x0 0000000000000003   x1 0000000000100000
  x2 000000000000c000   x3 ffffff8018000000
  x4 0000000000000015   x5 00ffffffffffffff
  x6 00000000110a120b   x7 fefefeff646c606d
  x8 7f7f7f7f7f7f7f7f   x9 0000000000000001
 x10 0101010101010101  x11 ffff0002b0e00000
 x12 0000000271000000  x13 0000ffffc0200000
 x14 0000000003100000  x15 0000ffffc0100000
 x16 0000000000000004  x17 ffffff8001138014
 x18 0000000000000000  x19 ffffff800113c2d0
 x20 ffffff8018000000  x21 0000000000000000
 x22 0000000000000001  x23 0000000000000001
 x24 0000000000000004  x25 ffffffc1e7fd3060
 x26 ffffffc1e7fd7050  x27 ffffff8009e46000
 x28 ffffffc1def7d400  x29 ffffffc1e7fd6f50
 x30 0000000000000016   sp ffffffc1e7fd6f50
  pc ffffff8018004050 cpsr 200001c5 (EL1h)

0xffffff8018004050:
  pc ffffff8018004050   sp ffffffc1e7fd6f50   fp ffffffc1e7fd6f50
flush_smp_call_function_queue+0xb8/0x160:
  pc ffffff8008150e00   sp ffffffc1e7fd6f60   fp ffffffc1e7fd6f70
generic_smp_call_function_single_interrupt+0x18/0x20:
  pc ffffff8008151d28   sp ffffffc1e7fd6f80   fp ffffffc1e7fd6fa0
handle_IPI+0x94/0x2e8:
  pc ffffff800809322c   sp ffffffc1e7fd6fb0   fp ffffffc1e7fd6fb0
gic_handle_irq+0xa8/0xb0:
  pc ffffff8008080d90   sp ffffffc1e7fd6fc0   fp ffffffc1e7fd7000
el1_irq+0xe8/0x18c:
  pc ffffff8008082be8   sp ffffffc1e7fd7010   fp ffffffc1e7fd7040
cpuidle_enter_state+0xb8/0x380:
  pc ffffff8008b9b330   sp ffffffc1def9bd80   fp ffffffc1def9beb0
cpuidle_enter+0x34/0x48:
  pc ffffff8008b9b66c   sp ffffffc1def9bec0   fp ffffffc1def9bf00
call_cpuidle+0x44/0x70:
  pc ffffff8008112a1c   sp ffffffc1def9bf10   fp ffffffc1def9bf30
cpu_startup_entry+0x1b0/0x200:
  pc ffffff8008112d98   sp ffffffc1def9bf40   fp ffffffc1def9bf60
secondary_start_kernel+0x190/0x1f8:
  pc ffffff8008092ce8   sp ffffffc1def9bf70   fp ffffffc1def9bfd0
0x8115a1a4:
  pc 000000008115a1a4   sp ffffffc1def9bfe0   fp 0000000000000000
debug>   x0 0000000000000003   x1 0000000000100000
  x2 000000000000c000   x3 ffffff8018000000
  x4 0000000000000015   x5 00ffffffffffffff
  x6 00000000110a120b   x7 fefefeff646c606d
  x8 7f7f7f7f7f7f7f7f   x9 0000000000000001
 x10 0101010101010101  x11 ffff0002b0e00000
 x12 0000000271000000  x13 0000ffffc0200000
 x14 0000000003100000  x15 0000ffffc0100000
 x16 0000000000000004  x17 ffffff8001138014
 x18 0000000000000000  x19 ffffff800113c2d0
 x20 ffffff8018000000  x21 0000000000000000
 x22 0000000000000001  x23 0000000000000001
 x24 0000000000000004  x25 ffffffc1e7fd3060
 x26 ffffffc1e7fd7050  x27 ffffff8009e46000
 x28 ffffffc1def7d400  x29 ffffffc1e7fd6f50
 x30 0000000000000016   sp ffffffc1e7fd6f50
  pc ffffff8018004050 cpsr 200001c5 (EL1h)
 sp_el0   ffffffc1def7d400
 elr_el1  ffffff8008b9b330
 spsr_el1 60000045
debug> Dump for CPU5:
pid: 0  comm: swapper/5
  x0 0000000000000003   x1 0000000000100000
  x2 000000000000c000   x3 ffffff8018000000
  x4 0000000000000015   x5 00ffffffffffffff
  x6 00000000110a120b   x7 fefefeff646c606d
  x8 7f7f7f7f7f7f7f7f   x9 0000000000000001
 x10 0101010101010101  x11 ffff0002b0e00000
 x12 0000000271000000  x13 0000ffffc0200000
 x14 0000000003100000  x15 0000ffffc0100000
 x16 0000000000000005  x17 ffffff8001138014
 x18 0000000000000000  x19 ffffff800113c2d0
 x20 ffffff8018000000  x21 0000000000000000
 x22 0000000000000001  x23 0000000000000001
 x24 0000000000000005  x25 ffffffc1e7fec060
 x26 ffffffc1e7ff0050  x27 ffffff8009e46000
 x28 ffffffc1def7e200  x29 ffffffc1e7feff50
 x30 0000000000000016   sp ffffffc1e7feff50
  pc ffffff8018004050 cpsr 200001c5 (EL1h)

0xffffff8018004050:
  pc ffffff8018004050   sp ffffffc1e7feff50   fp ffffffc1e7feff50
flush_smp_call_function_queue+0xb8/0x160:
  pc ffffff8008150e00   sp ffffffc1e7feff60   fp ffffffc1e7feff70
generic_smp_call_function_single_interrupt+0x18/0x20:
  pc ffffff8008151d28   sp ffffffc1e7feff80   fp ffffffc1e7feffa0
handle_IPI+0x94/0x2e8:
  pc ffffff800809322c   sp ffffffc1e7feffb0   fp ffffffc1e7feffb0
gic_handle_irq+0xa8/0xb0:
  pc ffffff8008080d90   sp ffffffc1e7feffc0   fp ffffffc1e7ff0000
el1_irq+0xe8/0x18c:
  pc ffffff8008082be8   sp ffffffc1e7ff0010   fp ffffffc1e7ff0040
cpuidle_enter_state+0xb8/0x380:
  pc ffffff8008b9b330   sp ffffffc1def9fd80   fp ffffffc1def9feb0
cpuidle_enter+0x34/0x48:
  pc ffffff8008b9b66c   sp ffffffc1def9fec0   fp ffffffc1def9ff00
call_cpuidle+0x44/0x70:
  pc ffffff8008112a1c   sp ffffffc1def9ff10   fp ffffffc1def9ff30
cpu_startup_entry+0x1b0/0x200:
  pc ffffff8008112d98   sp ffffffc1def9ff40   fp ffffffc1def9ff60
secondary_start_kernel+0x190/0x1f8:
  pc ffffff8008092ce8   sp ffffffc1def9ff70   fp ffffffc1def9ffd0
0x8115a1a4:
  pc 000000008115a1a4   sp ffffffc1def9ffe0   fp 0000000000000000
debug>   x0 0000000000000003   x1 0000000000100000
  x2 000000000000c000   x3 ffffff8018000000
  x4 0000000000000015   x5 00ffffffffffffff
  x6 00000000110a120b   x7 fefefeff646c606d
  x8 7f7f7f7f7f7f7f7f   x9 0000000000000001
 x10 0101010101010101  x11 ffff0002b0e00000
 x12 0000000271000000  x13 0000ffffc0200000
 x14 0000000003100000  x15 0000ffffc0100000
 x16 0000000000000005  x17 ffffff8001138014
 x18 0000000000000000  x19 ffffff800113c2d0
 x20 ffffff8018000000  x21 0000000000000000
 x22 0000000000000001  x23 0000000000000001
 x24 0000000000000005  x25 ffffffc1e7fec060
 x26 ffffffc1e7ff0050  x27 ffffff8009e46000
 x28 ffffffc1def7e200  x29 ffffffc1e7feff50
 x30 0000000000000016   sp ffffffc1e7feff50
  pc ffffff8018004050 cpsr 200001c5 (EL1h)
 sp_el0   ffffffc1def7e200
 elr_el1  ffffff8008b9b330
 spsr_el1 60000045
debug> Dump for CPU3:
pid: 8021  comm: jailhouse
  x0 0000000000000003   x1 0000000000100000
  x2 000000000000c000   x3 ffffff8018000000
  x4 0000000000000000   x5 0000000000000031
  x6 ffffffc1e7fff340   x7 5e72736877646c75
  x8 7f7f7f7f7f7f7f7f   x9 fefefdff6862726f
 x10 ffffff7f7f7f7f7f  x11 ffff0002b0e00000
 x12 0000000271000000  x13 0000ffffc0200000
 x14 0000000003100000  x15 0000ffffc0100000
 x16 0000000000000003  x17 ffffff8001138014
 x18 0000000000000000  x19 ffffff800113c2d0
 x20 ffffff8018000000  x21 0000000000000000
 x22 0000000000000040  x23 0000000000000000
 x24 ffffff800113b990  x25 ffffff800113bf80
 x26 ffffff8018000000  x27 ffffff8009e5a998
 x28 ffffff800113c2d0  x29 ffffffc18b30fbc0
 x30 0000000000000016   sp ffffffc18b30fbc0
  pc ffffff8018004050 cpsr 200000c5 (EL1h)

0xffffff8018004050:
  pc ffffff8018004050   sp ffffffc18b30fbc0   fp ffffffc18b30fbc0
on_each_cpu+0x58/0x98:
  pc ffffff8008151800   sp ffffffc18b30fbd0   fp ffffffc18b30fbe0
jailhouse_cmd_enable+0x420/0x710 [jailhouse]:
  pc ffffff8001138a10   sp ffffffc18b30fbf0   fp ffffffc18b30fc10
jailhouse_ioctl+0x8c/0x110 [jailhouse]:
  pc ffffff8001138d8c   sp ffffffc18b30fc20   fp ffffffc18b30fde0
do_vfs_ioctl+0xb0/0x8d8:
  pc ffffff8008273188   sp ffffffc18b30fdf0   fp ffffffc18b30fe00
SyS_ioctl+0x8c/0xa8:
  pc ffffff8008273a3c   sp ffffffc18b30fe10   fp ffffffc18b30fe80
el0_svc_naked+0x34/0x38:
  pc ffffff80080838c0   sp ffffffc18b30fe90   fp 0000000000000000
debug>   x0 0000000000000003   x1 0000000000100000
  x2 000000000000c000   x3 ffffff8018000000
  x4 0000000000000000   x5 0000000000000031
  x6 ffffffc1e7fff340   x7 5e72736877646c75
  x8 7f7f7f7f7f7f7f7f   x9 fefefdff6862726f
 x10 ffffff7f7f7f7f7f  x11 ffff0002b0e00000
 x12 0000000271000000  x13 0000ffffc0200000
 x14 0000000003100000  x15 0000ffffc0100000
 x16 0000000000000003  x17 ffffff8001138014
 x18 0000000000000000  x19 ffffff800113c2d0
 x20 ffffff8018000000  x21 0000000000000000
 x22 0000000000000040  x23 0000000000000000
 x24 ffffff800113b990  x25 ffffff800113bf80
 x26 ffffff8018000000  x27 ffffff8009e5a998
 x28 ffffff800113c2d0  x29 ffffffc18b30fbc0
 x30 0000000000000016   sp ffffffc18b30fbc0
  pc ffffff8018004050 cpsr 200000c5 (EL1h)
 sp_el0   ffffffc199945400
 elr_el1  ffffff800845c6ec
 spsr_el1 20000045
debug> Dump for CPU0:
pid: 0  comm: swapper/0
  x0 0000000000000003   x1 0000000000100000
  x2 000000000000c000   x3 ffffff8018000000
  x4 0000000000000015   x5 00ffffffffffffff
  x6 00000000110a120b   x7 fefefeff646c606d
  x8 7f7f7f7f7f7f7f7f   x9 0000000000000001
 x10 0101010101010101  x11 ffff0002b0e00000
 x12 0000000271000000  x13 0000ffffc0200000
 x14 0000000003100000  x15 0000ffffc0100000
 x16 0000000000000000  x17 ffffff8001138014
 x18 0000000000000000  x19 ffffff800113c2d0
 x20 ffffff8018000000  x21 0000000000000000
 x22 0000000000000001  x23 0000000000000001
 x24 0000000000000000  x25 ffffffc1e7f6f060
 x26 ffffffc1e7f73050  x27 ffffff8009e46000
 x28 ffffff8009e513c0  x29 ffffffc1e7f72f50
 x30 0000000000000016   sp ffffffc1e7f72f50
  pc ffffff8018004050 cpsr 200001c5 (EL1h)

0xffffff8018004050:
  pc ffffff8018004050   sp ffffffc1e7f72f50   fp ffffffc1e7f72f50
flush_smp_call_function_queue+0xb8/0x160:
  pc ffffff8008150e00   sp ffffffc1e7f72f60   fp ffffffc1e7f72f70
generic_smp_call_function_single_interrupt+0x18/0x20:
  pc ffffff8008151d28   sp ffffffc1e7f72f80   fp ffffffc1e7f72fa0
handle_IPI+0x94/0x2e8:
  pc ffffff800809322c   sp ffffffc1e7f72fb0   fp ffffffc1e7f72fb0
gic_handle_irq+0xa8/0xb0:
  pc ffffff8008080d90   sp ffffffc1e7f72fc0   fp ffffffc1e7f73000
el1_irq+0xe8/0x18c:
  pc ffffff8008082be8   sp ffffffc1e7f73010   fp ffffffc1e7f73040
cpuidle_enter_state+0xb8/0x380:
  pc ffffff8008b9b330   sp ffffff8009e43d30   fp ffffff8009e43e60
cpuidle_enter+0x34/0x48:
  pc ffffff8008b9b66c   sp ffffff8009e43e70   fp ffffff8009e43eb0
call_cpuidle+0x44/0x70:
  pc ffffff8008112a1c   sp ffffff8009e43ec0   fp ffffff8009e43ee0
cpu_startup_entry+0x1b0/0x200:
  pc ffffff8008112d98   sp ffffff8009e43ef0   fp ffffff8009e43f10
rest_init+0x84/0x90:
  pc ffffff8008f507b4   sp ffffff8009e43f20   fp ffffff8009e43f80
start_kernel+0x370/0x384:
  pc ffffff80095e0b64   sp ffffff8009e43f90   fp ffffff8009e43fa0
__primary_switched+0x80/0x94:
  pc ffffff80095e0204   sp ffffff8009e43fb0   fp ffffff8009e43ff0
debug>   x0 0000000000000003   x1 0000000000100000
  x2 000000000000c000   x3 ffffff8018000000
  x4 0000000000000015   x5 00ffffffffffffff
  x6 00000000110a120b   x7 fefefeff646c606d
  x8 7f7f7f7f7f7f7f7f   x9 0000000000000001
 x10 0101010101010101  x11 ffff0002b0e00000
 x12 0000000271000000  x13 0000ffffc0200000
 x14 0000000003100000  x15 0000ffffc0100000
 x16 0000000000000000  x17 ffffff8001138014
 x18 0000000000000000  x19 ffffff800113c2d0
 x20 ffffff8018000000  x21 0000000000000000
 x22 0000000000000001  x23 0000000000000001
 x24 0000000000000000  x25 ffffffc1e7f6f060
 x26 ffffffc1e7f73050  x27 ffffff8009e46000
 x28 ffffff8009e513c0  x29 ffffffc1e7f72f50
 x30 0000000000000016   sp ffffffc1e7f72f50
  pc ffffff8018004050 cpsr 200001c5 (EL1h)
 sp_el0   ffffff8009e513c0
 elr_el1  ffffff8008b9b330
 spsr_el1 60000045
debug> Dump for CPU0:
pid: 0  comm: swapper/0
  x0 0000000000000003   x1 0000000000100000
  x2 000000000000c000   x3 ffffff8018000000
  x4 0000000000000015   x5 00ffffffffffffff
  x6 00000000110a120b   x7 fefefeff646c606d
  x8 7f7f7f7f7f7f7f7f   x9 0000000000000001
 x10 0101010101010101  x11 ffff0002b0e00000
 x12 0000000271000000  x13 0000ffffc0200000
 x14 0000000003100000  x15 0000ffffc0100000
 x16 0000000000000000  x17 ffffff8001138014
 x18 0000000000000000  x19 ffffff800113c2d0
 x20 ffffff8018000000  x21 0000000000000000
 x22 0000000000000001  x23 0000000000000001
 x24 0000000000000000  x25 ffffffc1e7f6f060
 x26 ffffffc1e7f73050  x27 ffffff8009e46000
 x28 ffffff8009e513c0  x29 ffffffc1e7f72f50
 x30 0000000000000016   sp ffffffc1e7f72f50
  pc ffffff8018004050 cpsr 200001c5 (EL1h)

0xffffff8018004050:
  pc ffffff8018004050   sp ffffffc1e7f72f50   fp ffffffc1e7f72f50
flush_smp_call_function_queue+0xb8/0x160:
  pc ffffff8008150e00   sp ffffffc1e7f72f60   fp ffffffc1e7f72f70
generic_smp_call_function_single_interrupt+0x18/0x20:
  pc ffffff8008151d28   sp ffffffc1e7f72f80   fp ffffffc1e7f72fa0
handle_IPI+0x94/0x2e8:
  pc ffffff800809322c   sp ffffffc1e7f72fb0   fp ffffffc1e7f72fb0
gic_handle_irq+0xa8/0xb0:
  pc ffffff8008080d90   sp ffffffc1e7f72fc0   fp ffffffc1e7f73000
el1_irq+0xe8/0x18c:
  pc ffffff8008082be8   sp ffffffc1e7f73010   fp ffffffc1e7f73040
cpuidle_enter_state+0xb8/0x380:
  pc ffffff8008b9b330   sp ffffff8009e43d30   fp ffffff8009e43e60
cpuidle_enter+0x34/0x48:
  pc ffffff8008b9b66c   sp ffffff8009e43e70   fp ffffff8009e43eb0
call_cpuidle+0x44/0x70:
  pc ffffff8008112a1c   sp ffffff8009e43ec0   fp ffffff8009e43ee0
cpu_startup_entry+0x1b0/0x200:
  pc ffffff8008112d98   sp ffffff8009e43ef0   fp ffffff8009e43f10
rest_init+0x84/0x90:
  pc ffffff8008f507b4   sp ffffff8009e43f20   fp ffffff8009e43f80
start_kernel+0x370/0x384:
  pc ffffff80095e0b64   sp ffffff8009e43f90   fp ffffff8009e43fa0
__primary_switched+0x80/0x94:
  pc ffffff80095e0204   sp ffffff8009e43fb0   fp ffffff8009e43ff0
debug>   x0 0000000000000003   x1 0000000000100000
  x2 000000000000c000   x3 ffffff8018000000
  x4 0000000000000015   x5 00ffffffffffffff
  x6 00000000110a120b   x7 fefefeff646c606d
  x8 7f7f7f7f7f7f7f7f   x9 0000000000000001
 x10 0101010101010101  x11 ffff0002b0e00000
 x12 0000000271000000  x13 0000ffffc0200000
 x14 0000000003100000  x15 0000ffffc0100000
 x16 0000000000000000  x17 ffffff8001138014
 x18 0000000000000000  x19 ffffff800113c2d0
 x20 ffffff8018000000  x21 0000000000000000
 x22 0000000000000001  x23 0000000000000001
 x24 0000000000000000  x25 ffffffc1e7f6f060
 x26 ffffffc1e7f73050  x27 ffffff8009e46000
 x28 ffffff8009e513c0  x29 ffffffc1e7f72f50
 x30 0000000000000016   sp ffffffc1e7f72f50
  pc ffffff8018004050 cpsr 200001c5 (EL1h)
 sp_el0   ffffff8009e513c0
 elr_el1  ffffff8008b9b330
 spsr_el1 60000045
debug> [0000.241] I> Welcome to MB2(TBoot-BPMP)(version: 01.00.160913-t186-M-00.00-mobile-7d3edb9d)
[0000.249] I> bit @ 0xd480000
[0000.252] I> Boot-device: eMMC
[0000.259] I> sdmmc bdev is already initialized
[0000.264] I> pmic: reset reason (nverc)        : 0x0
[0000.296] I> Found 18 partitions in SDMMC_BOOT (instance 3)
[0000.314] I> Found 33 partitions in SDMMC_USER (instance 3)
[0000.320] W> No valid slot number is found in scratch register
[0000.326] W> Return default slot: _a
[0000.330] I> A/B: bin_type (16) slot 0
[0000.333] I> Loading partition bpmp-fw at 0xd7800000
[0000.338] I> Reading two headers - addr:0xd7800000 blocks:1
[0000.343] I> Addr: 0xd7800000, start-block: 58777608, num_blocks: 1
[0000.368] I> Binary(16) of size 533504 is loaded @ 0xd7800000
[0000.374] W> No valid slot number is found in scratch register
[0000.380] W> Return default slot: _a
[0000.383] I> A/B: bin_type (17) slot 0
[0000.387] I> Loading partition bpmp-fw-dtb at 0xd79f0000
[0000.392] I> Reading two headers - addr:0xd79f0000 blocks:1
[0000.397] I> Addr: 0xd79f0000, start-block: 58780024, num_blocks: 1
[0000.421] I> Binary(17) of size 465840 is loaded @ 0xd798e200
[0000.599] I> Loading SCE-FW ...
[0000.602] W> No valid slot number is found in scratch register
[0000.608] W> Return default slot: _a
[0000.611] I> A/B: bin_type (12) slot 0
[0000.615] I> Loading partition sce-fw at 0xd7300000
[0000.619] I> Reading two headers - addr:0xd7300000 blocks:1
[0000.625] I> Addr: 0xd7300000, start-block: 58784120, num_blocks: 1
[0000.644] I> Binary(12) of size 125168 is loaded @ 0xd7300000
[0000.650] I> Init SCE
[0000.652] I> Loading APE-FW ...
[0000.655] W> No valid slot number is found in scratch register
[0000.661] W> Return default slot: _a
[0000.664] I> A/B: bin_type (11) slot 0
[0000.668] I> Loading partition adsp-fw at 0xd7400000
[0000.673] I> Reading two headers - addr:0xd7400000 blocks:1
[0000.678] I> Addr: 0xd7400000, start-block: 58761224, num_blocks: 1
[0000.697] I> Binary(11) of size 107808 is loaded @ 0xd7400000
[0000.703] I> Copy BTCM section
[0000.706] W> No valid slot number is found in scratch register
[0000.712] W> Return default slot: _a
[0000.715] I> A/B: bin_type (13) slot 0
[0000.719] I> Loading partition cpu-bootloader at 0x96000000
[0000.724] I> Reading two headers - addr:0x96000000 blocks:1
[0000.730] I> Addr: 0x96000000, start-block: 58740744, num_blocks: 1
[0000.751] I> Binary(13) of size 283728 is loaded @ 0x96000000
[0000.757] W> No valid slot number is found in scratch register
[0000.762] W> Return default slot: _a
[0000.766] I> A/B: bin_type (20) slot 0
[0000.769] I> Loading partition bootloader-dtb at 0x8520f400
[0000.775] I> Reading two headers - addr:0x8520f400 blocks:1
[0000.780] I> Addr: 0x8520f400, start-block: 58742792, num_blocks: 1
[0000.803] I> Binary(20) of size 371232 is loaded @ 0x8520f400
[0000.808] W> No valid slot number is found in scratch register
[0000.814] W> Return default slot: _a
[0000.817] I> A/B: bin_type (14) slot 0
[0000.821] I> Loading partition secure-os at 0x8530f600
[0000.826] I> Reading two headers - addr:0x8530f600 blocks:1
[0000.832] I> Addr: 0x8530f600, start-block: 58744840, num_blocks: 1
[0000.853] I> Binary(14) of size 312752 is loaded @ 0x8530f600
[0000.861] I> TOS boot-params @ 0x85000000
[0000.865] I> TOS params prepared
[0000.868] I> Loading EKS ...
[0000.870] I> A/B: bin_type (15) slot 0
[0000.874] I> Loading partition eks at 0x8590f800
[0000.879] I> Reading two headers - addr:0x8590f800 blocks:1
[0000.884] I> Addr: 0x8590f800, start-block: 58757128, num_blocks: 1
[0000.903] I> Binary(15) of size 1040 is loaded @ 0x8590f800
[0000.908] I> EKB detected (length: 0x400) @ 0x8590f800
[0000.913] I> Copied encrypted keys
[0000.917] I> boot profiler @ 0x275844000
[0000.921] I> boot profiler for TOS @ 0x275844000
[0000.926] I> Unhalting SCE
[0000.928] I> Primary Memory Start:80000000 Size:70000000
[0000.934] I> Extended Memory Start:f0110000 Size:1856f0000
[0000.940] I> MB2(TBoot-BPMP) done

NOTICE:  BL31: v1.3(release):23b153a63
NOTICE:  BL31: Built : 22:43:09, Dec  9 2019
ipc-unittest-main: 1519: Welcome to IPC unittest!!!
ipc-unittest-main: 1531: waiting forever
ipc-unittest-srv: 329: Init unittest services!!!
keystore-demo: 141: Hello world from keystore-demo app
keystore-demo: 207: main: EKB contents match expected value
exit called, thread 0xffffffffea87ad58, name trusty_app_2_7d18fc60-e9fc-11e8
platform_bootstrap_epilog: trusty bootstrap complete
[0001.300] I> Welcome to Cboot
[0001.303] I> Cboot Version: t186-c3c778fb
[0001.307] I> CPU-BL Params @ 0x275800000
[0001.311] I>  0) Base:0x00000000 Size:0x00000000
[0001.315] I>  1) Base:0x277f00000 Size:0x00100000
[0001.320] I>  2) Base:0x277e00000 Size:0x00100000
[0001.324] I>  3) Base:0x277d00000 Size:0x00100000
[0001.329] I>  4) Base:0x277c00000 Size:0x00100000
[0001.333] I>  5) Base:0x277b00000 Size:0x00100000
[0001.338] I>  6) Base:0x277800000 Size:0x00200000
[0001.342] I>  7) Base:0x277400000 Size:0x00400000
[0001.347] I>  8) Base:0x277a00000 Size:0x00100000
[0001.351] I>  9) Base:0x277300000 Size:0x00100000
[0001.356] I> 10) Base:0x276800000 Size:0x00800000
[0001.360] I> 11) Base:0x30000000 Size:0x00040000
[0001.365] I> 12) Base:0xf0000000 Size:0x00100000
[0001.369] I> 13) Base:0x30040000 Size:0x00001000
[0001.374] I> 14) Base:0x30048000 Size:0x00001000
[0001.378] I> 15) Base:0x30049000 Size:0x00001000
[0001.383] I> 16) Base:0x3004a000 Size:0x00001000
[0001.387] I> 17) Base:0x3004b000 Size:0x00001000
[0001.391] I> 18) Base:0x3004c000 Size:0x00001000
[0001.396] I> 19) Base:0x3004d000 Size:0x00001000
[0001.400] I> 20) Base:0x3004e000 Size:0x00001000
[0001.405] I> 21) Base:0x3004f000 Size:0x00001000
[0001.409] I> 22) Base:0x00000000 Size:0x00000000
[0001.414] I> 23) Base:0xf0100000 Size:0x00010000
[0001.418] I> 24) Base:0x00000000 Size:0x00000000
[0001.422] I> 25) Base:0x00000000 Size:0x00000000
[0001.427] I> 26) Base:0x00000000 Size:0x00000000
[0001.431] I> 27) Base:0x00000000 Size:0x00000000
[0001.436] I> 28) Base:0x84400000 Size:0x00400000
[0001.440] I> 29) Base:0x30000000 Size:0x00010000
[0001.445] I> 30) Base:0x278000000 Size:0x08000000
[0001.449] I> 31) Base:0x00000000 Size:0x00000000
[0001.454] I> 32) Base:0x276000000 Size:0x00600000
[0001.458] I> 33) Base:0x80000000 Size:0x70000000
[0001.462] I> 34) Base:0xf0110000 Size:0x1856f0000
[0001.467] I> 35) Base:0x00000000 Size:0x00000000
[0001.471] I> 36) Base:0x00000000 Size:0x00000000
[0001.476] I> 37) Base:0x2772e0000 Size:0x00020000
[0001.480] I> 38) Base:0x84000000 Size:0x00400000
[0001.485] I> 39) Base:0x96000000 Size:0x02000000
[0001.489] I> 40) Base:0x85000000 Size:0x01200000
[0001.494] I> 41) Base:0x275800000 Size:0x00500000
[0001.498] I> 42) Base:0x00000000 Size:0x00000000
[0001.503] I> 43) Base:0x00000000 Size:0x00000000
[0001.507] GIC-SPI Target CPU: 4
[0001.510] Interrupts Init done
[0001.514] calling constructors
[0001.517] initializing heap
[0001.519] initializing threads
[0001.523] initializing timers
[0001.526] creating bootstrap completion thread
[0001.530] top of bootstrap2()
[0001.534] CPU: ARM Cortex A57
[0001.537] CPU: MIDR: 0x411FD073, MPIDR: 0x80000100
[0001.542] initializing platform
[0001.545] I> Bl_dtb @0x8520f400
[0001.548] I> gpio framework initialized
[0001.554] I> tegrabl_gpio_driver_register: register 'nvidia,tegra186-gpio' driver
[0001.564] I> tegrabl_gpio_driver_register: register 'nvidia,tegra186-gpio-aon' driver
[0001.572] I> GPIO framework and drivers are initialized.
[0001.577] I> Boot-device: eMMC
[0001.584] I> sdmmc bdev is already initialized
[0001.615] I> Found 18 partitions in SDMMC_BOOT (instance 3)
[0001.632] I> Found 33 partitions in SDMMC_USER (instance 3)
[0001.638] W> opt-in fuse is not set, skip fuse_burning
[0001.643] I> Reserved memory at 0xfbe00000 for U-Boot relocation
[0001.649] W> No valid slot number is found in scratch register
[0001.654] W> Return default slot: _a
[0001.658] I> A/B: bin_type (21) slot 0
[0001.661] I> Loading partition kernel-dtb at 0x80000000 from device(0x1)
[0001.678] I> Kernel_dtb @0x80000000
[0001.682] I> tegrabl_tca9539_init: i2c bus: 0, slave addr: 0xee
[0001.692] I> tegrabl_gpio_driver_register: register 'tca9539_gpio_driver' driver
[0001.699] I> tegrabl_tca9539_init: i2c bus: 0, slave addr: 0xe8
[0001.708] I> tegrabl_gpio_driver_register: register 'tca9539_gpio_driver' driver
[0001.718] I> fixed regulator driver initialized
[0001.751] I> register 'maxim' power off handle
[0001.757] I> virtual i2c enabled
[0001.760] I> registered 'maxim,max77620' pmic
[0001.765] I> tegrabl_gpio_driver_register: register 'max77620-gpio' driver
[0001.778] I> Find /i2c@c250000's alias i2c7
[0001.782] I> Reading eeprom i2c=7 address=0x50
[0001.811] I> Device at /i2c@c250000:0x50
[0001.815] I> Reading eeprom i2c=7 address=0x57
[0001.844] I> Device at /i2c@c250000:0x57
[0001.848] I> Find /i2c@c240000's alias i2c1
[0001.852] I> Reading eeprom i2c=1 address=0x51
[0001.857] E> I2C: slave not found in slaves.
[0001.861] E> I2C: Could not write 0 bytes to slave: 0x00a2 with repeat start true.
[0001.869] E> I2C_DEV: Failed to send register address 0x00000000.
[0001.875] E> I2C_DEV: Could not read 256 registers of size 1 from slave 0xa2 at 0x00000000 via instance 1.
[0001.884] E> eeprom: Retry to read I2C slave device.
[0001.889] E> I2C: slave not found in slaves.
[0001.893] E> I2C: Could not write 0 bytes to slave: 0x00a2 with repeat start true.
[0001.901] E> I2C_DEV: Failed to send register address 0x00000000.
[0001.907] E> I2C_DEV: Could not read 256 registers of size 1 from slave 0xa2 at 0x00000000 via instance 1.
[0001.916] E> eeprom: Failed to read I2C slave device
[0001.921] I> Eeprom read failed 0x3526070d
[0001.926] I> Find /i2c@3160000's alias i2c0
[0001.930] I> Reading eeprom i2c=0 address=0x50
[0001.934] E> I2C: slave not found in slaves.
[0001.938] E> I2C: Could not write 0 bytes to slave: 0x00a0 with repeat start true.
[0001.946] E> I2C_DEV: Failed to send register address 0x00000000.
[0001.952] E> I2C_DEV: Could not read 256 registers of size 1 from slave 0xa0 at 0x00000000 via instance 0.
[0001.961] E> eeprom: Failed to read I2C slave device
[0001.966] I> Eeprom read failed 0x3526070d
[0001.971] I> Find /i2c@3180000's alias i2c2
[0001.975] I> Reading eeprom i2c=2 address=0x54
[0001.979] I> Enabling gpio chip_id = 2, gpio pin = 9
[0002.010] I> Disabling gpio chip_id = 2, gpio pin = 9
[0002.015] I> Device at /i2c@3180000:0x54
[0002.019] I> Reading eeprom i2c=2 address=0x57
[0002.023] I> Enabling gpio chip_id = 2, gpio pin = 9
[0002.028] E> I2C: slave not found in slaves.
[0002.033] E> I2C: Could not write 0 bytes to slave: 0x00ae with repeat start true.
[0002.040] E> I2C_DEV: Failed to send register address 0x00000000.
[0002.046] E> I2C_DEV: Could not read 256 registers of size 1 from slave 0xae at 0x00000000 via instance 2.
[0002.056] E> eeprom: Failed to read I2C slave device
[0002.060] I> Disabling gpio chip_id = 2, gpio pin = 9
[0002.066] I> Eeprom read failed 0x00000000
[0002.069] I> create_pm_ids: id: 3310-1000-B02-D, len: 15
[0002.075] I> config: mem-type:00,power-config:00,misc-config:00,modem-config:00,touch-config:00,display-config:00,, len: 93
[0002.086] I> create_pm_ids: id: 2597-0000-501-C, len: 15
[0002.091] I> config: mem-type:00,power-config:00,misc-config:00,modem-config:00,touch-config:00,display-config:00,, len: 93
[0002.102] I> create_pm_ids: id: 3326-1000-100-M, len: 15
[0002.107] I> config: mem-type:ff,power-config:ff,misc-config:ff,modem-config:ff,touch-config:ff,display-config:ff,, len: 93
[0002.141] I> enabling 'vdd-hdmi' regulator
[0002.157] I> regulator 'vdd-hdmi' already enabled
[0002.161] I> hdmi cable connected
[0002.170] I> setting 'vdd-pex-1v00' regulator to 1000000 micro volts
[0002.182] I> setting 'vdd-1v8' regulator to 1800000 micro volts
[0002.191] E> cannot find any other nvdisp nodes
[0002.212] I> edid read success
[0002.215] I> width = 640, height = 480, frequency = 25174825
[0002.220] I> width = 640, height = 480, frequency = 25174825
[0002.226] I> width = 1600, height = 1200, frequency = 162000000
[0002.231] I> Best mode Width = 640, Height = 480, freq = 25174825
[0002.241] I> hdmi_enable, starting HDMI initialisation
[0002.249] I> hdmi_enable, HDMI initialisation complete
[0002.255] initializing target
[0002.258] calling apps_init()
[0002.261] starting app kernel_boot_app
[0002.283] I> found decompressor handler: lz4-legacy
[0002.288] I> decompressing BMP blob ...
[0002.298] I> Kernel type = Normal
[0002.301] I> Loading partition kernel-bootctrl at 0xa8000000 from device(0x1)
[0002.316] W> tegrabl_get_kernel_bootctrl: magic number(0x00000000) is invalid
[0002.323] W> tegrabl_get_kernel_bootctrl: use default dummy boot control data
[0002.330] I> ########## Fixed storage boot ##########
[0002.335] I> Loading kernel from partition ...
[0002.339] W> No valid slot number is found in scratch register
[0002.345] W> Return default slot: _a
[0002.348] I> A/B: bin_type (24) slot 0
[0002.364] I> Boot image size read from image header: f2f08
[0002.369] I> Boot image load address: 0x0x80400000
[0002.373] I> Loading partition kernel at 0x80400000 from device(0x1)
[0003.333] I> Validate kernel ...
[0003.336] I> T18x: Authenticate kernel (bin_type 24), max size 0x4000000
[0003.344] I> kernel-dtb is already loaded
[0003.348] I> Validate kernel-dtb ...
[0003.351] I> T18x: Authenticate kernel-dtb (bin_type 21), max size 0x100000
[0003.359] I> Checking boot.img header magic ... [0003.363] I> [OK]
[0003.365] I> Kernel hdr @0x80400000
[0003.368] I> Kernel dtb @0x80000000
[0003.371] I> decompressor handler not found
[0003.375] I> Copying kernel image (477882 bytes) from 0x80400800 to 0x80800000 ... [0003.383] I> Done
[0003.384] I> Move ramdisk (len: 0) from 0x80475800 to 0x94830000
[0003.392] I> Updated bpmp info to DTB
[0003.398] I> Ramdisk: Base: 0x94830000; Size: 0x0
[0003.402] I> Updated initrd info to DTB
[0003.406] W> WARN: Fail to override "console=none" in commandline
[0003.412] E> tegrabl_linuxboot_add_disp_param, du 1 failed to get display params
[0003.419] E> tegrabl_linuxboot_add_disp_param, du 1 failed to get display params
[0003.426] I> disabled_core_mask: 0xffffff0c
[0003.430] W> No valid slot number is found in scratch register
[0003.436] W> Return default slot: _a
[0003.439] I> Active slot suffix: 
[0003.442] I> add_boot_slot_suffix: slot_suffix = 
[0003.447] I> Linux Cmdline: root=/dev/mmcblk0p1 rw rootwait rootfstype=ext4 console=ttyS0,115200n8 console=tty0 fbcon=map:0 net.ifnames=0 video=tegrafb no_console_suspend=1 earlycon=uart8250,mmio32,0x31 
[0003.489] I> Updated bootarg info to DTB
[0003.492] I> eeprom_get_mac_addr: MAC (type: 0): 00:04:4b:a8:11:d7
[0003.499] I> eeprom_get_mac_addr: MAC (type: 1): 00:04:4b:a8:11:d8
[0003.505] I> eeprom_get_mac_addr: MAC (type: 2): 00:04:4b:a8:11:d9
[0003.511] E> Found no plugin manager ids in source DT
[0003.516] W> Add plugin manager ids from board info
[0003.521] E> "plugin-manager" doesn't exist, creating
[0003.526] E> "ids" doesn't exist, creating
[0003.530] E> "connection" doesn't exist, creating
[0003.534] E> "configs" doesn't exist, creating
[0003.539] I> create_pm_ids: id: 3310-1000-B02-D, len: 15
[0003.544] I> config: mem-type:00,power-config:00,misc-config:00,modem-config:00,touch-config:00,display-config:00,, len: 93
[0003.555] I> create_pm_ids: id: 2597-0000-501-C, len: 15
[0003.560] I> config: mem-type:00,power-config:00,misc-config:00,modem-config:00,touch-config:00,display-config:00,, len: 93
[0003.571] I> create_pm_ids: id: 3326-1000-100-M, len: 15
[0003.576] I> config: mem-type:ff,power-config:ff,misc-config:ff,modem-config:ff,touch-config:ff,display-config:ff,, len: 93
[0003.587] I> Adding plugin-manager/ids/3310-1000-B02=/i2c@c250000:module@0x50
[0003.594] E> "i2c@c250000" doesn't exist, creating
[0003.599] E> "module@0x50" doesn't exist, creating
[0003.604] I> Adding plugin-manager/ids/2597-0000-501=/i2c@c250000:module@0x57
[0003.611] E> "module@0x57" doesn't exist, creating
[0003.616] I> Adding plugin-manager/ids/3326-1000-100=/i2c@3180000:module@0x54
[0003.623] E> "i2c@3180000" doesn't exist, creating
[0003.628] E> "module@0x54" doesn't exist, creating
[0003.635] I> Adding plugin-manager/ids/3310-1000-B02-D
[0003.642] I> Adding plugin-manager/configs/3310-mem-type 00
[0003.647] I> Adding plugin-manager/configs/3310-power-config 00
[0003.653] I> Adding plugin-manager/configs/3310-misc-config 00
[0003.659] I> Adding plugin-manager/configs/3310-modem-config 00
[0003.665] I> Adding plugin-manager/configs/3310-touch-config 00
[0003.671] I> Adding plugin-manager/configs/3310-display-config 00
[0003.677] I> Adding plugin-manager/cvm
[0003.681] E> "chip-id" doesn't exist, creating
[0003.685] I> Adding plugin-manager/chip-id/A02P
[0003.690] E> "odm-data" doesn't exist, creating
[0003.694] I> Adding /chosen/plugin-manager/odm-data
[0003.704] I> added [base:0x80000000, size:0x70000000] to /memory
[0003.710] I> added [base:0xf0200000, size:0x185600000] to /memory
[0003.716] I> added [base:0x275e00000, size:0x200000] to /memory
[0003.722] I> added [base:0x276600000, size:0x200000] to /memory
[0003.727] I> added [base:0x277000000, size:0x200000] to /memory
[0003.733] I> Updated memory info to DTB
[0003.738] E> add_disp_param: failed to get display params for du=1
[0003.746] E> "reset" doesn't exist, creating
[0003.750] E> "pmc-reset-reason" doesn't exist, creating
[0003.755] E> "pmic-reset-reason" doesn't exist, creating
[0003.762] I> Adding ecid(00000001644007480000000003fb81c0) to DT
[0003.767] I> disabled_core_mask: 0xffffff0c
[0003.780] I> Add serial number:0320218169735 as DT property
[0003.789] I> Plugin-manager override starting
[0003.795] I> node /plugin-manager/fragement@0 matches
[0003.805] I> node /plugin-manager/fragement@4 matches
[0003.818] I> node /plugin-manager/fragment-sdwake-p3310-1000-300 matches
[0003.838] I> node /plugin-manager/fragement-pmon-p3310-1000-300 matches
[0003.847] I> node /plugin-manager/fragement-pmon-p3310-1000-800 matches
[0003.856] I> node /plugin-manager/fragment-devslp@0 matches
[0003.868] I> node /plugin-manager/fragment-500-pcie-config matches
[0003.883] I> node /plugin-manager/fragment-500-xusb-config matches
[0003.906] I> node /plugin-manager/fragment-p3310-c00-comm matches
[0003.919] I> node /plugin-manager/fragment-p3310-c00-pmic matches
[0003.930] I> node /plugin-manager/fragment-p3310-c01 matches
[0003.943] I> node /plugin-manager/fragment-p3310-c03 matches
[0003.977] I> node /plugin-manager/fragment-e3326@0 matches
[0004.058] I> node /plugin-manager/fragment-p3310-c00-camera matches
[0004.085] I> Disable plugin-manager status in FDT
[0004.090] I> Plugin-manager override finished successfully
[0004.095] I> tegrabl_load_kernel_and_dtb: Done
[0004.105] I> Kernel EP: 0x80800000, DTB: 0x80000000


U-Boot 2016.07-g0536cf2a27 (Dec 09 2019 - 22:43:10 -0800)

TEGRA186
Model: NVIDIA P2771-0000-500
DRAM:  7.8 GiB
MC:   Tegra SD/MMC: 0, Tegra SD/MMC: 1
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Net:   eth0: ethernet@2490000
Hit any key to stop autoboot:  0 
MMC: no card present
switch to partitions #0, OK
mmc0(part 0) is current device
Scanning mmc 0:1...
Found /boot/extlinux/extlinux.conf
Retrieving file: /boot/extlinux/extlinux.conf
744 bytes read in 89 ms (7.8 KiB/s)
1:      primary kernel
Retrieving file: /boot/initrd
5565140 bytes read in 240 ms (22.1 MiB/s)
Retrieving file: /boot/Image
34191368 bytes read in 858 ms (38 MiB/s)
append: root=/dev/mmcblk0p1 rw rootwait rootfstype=ext4 console=ttyS0,115200n8 console=tty0 fbcon=map:0 net.ifnames=0 video=tegrafb no_console_suspend=1 earlycon=uart8250,mmio32,0x3100000 nvdumper_reservM
## Flattened Device Tree blob at 80000000
   Booting using the fdt blob at 0x80000000
   reserving fdt memory region: addr=80000000 size=10000
   Using Device Tree in place at 0000000080000000, end 000000008005f9b7

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x100
[    0.000000] Linux version 4.9.140-tegra (buildbrain@mobile-u64-1935) (gcc version 7.3.1 20180425 [linaro-7.3-2018.05 revision d29120a424ecfbc167ef90065c0eeb7f91977701] (Linaro GCC 7.3-2018.05) ) #1 SM9
[    0.000000] Boot CPU: AArch64 Processor [411fd073]
[    0.000000] OF: fdt:memory scan node memory@80000000, reg size 16416,
[    0.000000] OF: fdt: - 80000000 ,  70000000
[    0.000000] OF: fdt: - f0200000 ,  185600000
[    0.000000] OF: fdt: - 275e00000 ,  200000
[    0.000000] OF: fdt: - 276600000 ,  200000
[    0.000000] OF: fdt: - 277000000 ,  200000
[    0.000000] earlycon: uart8250 at MMIO32 0x0000000003100000 (options '')
[    0.000000] bootconsole [uart8250] enabled
[    0.000000] Found tegra_fbmem2: 00140000@9607d000
[    0.000000] Found lut_mem2: 00002008@9607a000
<hit enter to activate fiq debugger>
[    3.836100] cgroup: cgroup2: unknown option "nsdelegate"
[    4.597511] random: crng init done
[    4.600939] random: 7 urandom warning(s) missed due to ratelimiting
[    5.644707] using random self ethernet address
[    5.659615] using random host ethernet address
[    6.250025] using random self ethernet address
[    6.254600] using random host ethernet address
[    7.143659] CPU1: shutdown
[    7.211501] CPU2: shutdown
[    7.562157] vdd-1v8: voltage operation not allowed
[    7.562178] sdhci-tegra 3440000.sdhci: could not set regulator OCR (-1)
[    7.581872] vdd-1v8: voltage operation not allowed
[    7.581894] sdhci-tegra 3440000.sdhci: could not set regulator OCR (-1)
[    7.602812] vdd-1v8: voltage operation not allowed
[    7.602826] sdhci-tegra 3440000.sdhci: could not set regulator OCR (-1)
[    7.605311] vdd-1v8: voltage operation not allowed
[    7.605328] sdhci-tegra 3440000.sdhci: could not set regulator OCR (-1)
[    7.713079] vdd-1v8: voltage operation not allowed
[    7.713096] sdhci-tegra 3440000.sdhci: could not set regulator OCR (-1)
[    7.714112] vdd-1v8: voltage operation not allowed
[    7.714131] sdhci-tegra 3440000.sdhci: could not set regulator OCR (-1)
[    7.715780] vdd-1v8: voltage operation not allowed
[    7.715796] sdhci-tegra 3440000.sdhci: could not set regulator OCR (-1)

Ubuntu 18.04.3 LTS tx2-desktop ttyS0

tx2-desktop login: 


------=_Part_782_551077851.1580325046696--
