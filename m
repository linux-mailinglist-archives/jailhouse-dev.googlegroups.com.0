Return-Path: <jailhouse-dev+bncBCQ7HUU4XULBBEWZYLYQKGQE7TVQ7XA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33d.google.com (mail-ot1-x33d.google.com [IPv6:2607:f8b0:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F2714C258
	for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jan 2020 22:50:12 +0100 (CET)
Received: by mail-ot1-x33d.google.com with SMTP id u13sf4791390otk.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jan 2020 13:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=eoLAF9ADMc0GsAq2SrC1YfNUouKHAQrP/lLJAaZqf7M=;
        b=r+EZBdG5r4x6qdrHZSQxqxwNpDMXISyc79VkUEVpOabzusTP4SPKhlOKYozzAM5h2F
         PQsc/mrBEn49pdbmsocOMpHKbnmZ6vbFUOQFbdhKjGM3razOhXHLpWAnRHdqm8e6IUV8
         WGdruZrmklwXNIH6XR9kya/3uzq4f6StmOBbO1Cvb/Qr1TJmUjSJRN3AfSX+xBkByXjs
         8QctlMyAMfzrjD1kugjAinenNCOvdh8stKQeZE/xENTZRAD92ixNO3OH75XBICtbpKxH
         uiUIy/FHPkWZKsvzTLWn/7V6myH/T+MPTbT2XnkkGF7+uWLuORYosnPX46llBwzAsGfi
         YxPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eoLAF9ADMc0GsAq2SrC1YfNUouKHAQrP/lLJAaZqf7M=;
        b=OEez9eMFzFZ1S3HCkaHRDelJYhX586lEp8KUrvAfjgj2pB+cRVy7UwTP+l4O82VGqv
         Da9cOyEt6WE/I4YyeigRulbFpFJ/1/1T24Evxh5sQZvN8yVKv2tmoDrQvA7jec97JYUP
         mIMT9DJd/pY1bysWZyLey+7h7eN6UE8WFAq4c/dCRi22oGrla3O7B4MzTCP92yT1mg1a
         c0GMIQ+rMkcpylgN+8y+4kCu1foxTE/XTyorJTvDciaHG8tVFoCV0nJu6RiKzfAx8RCG
         3Gwl5MDH5TDxe+t6ZfiNZ0AJnerrjnn5bonlpjZ8kGyZdUc4Phjiu9C1biTlrlUXsEkw
         eUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eoLAF9ADMc0GsAq2SrC1YfNUouKHAQrP/lLJAaZqf7M=;
        b=XHdPY7rPnkGTiSoElTz4BfgHMFVRs8J5oyIbfiqqb96qzGMO8GS/LvuoSYpTLS/a/Q
         d7qXFl1zMpLSKixIGwjv7zRSIpFN31+o9NLE139gyrAC4BGQE2oZ2pcY0Vjng0fYM+ZI
         ybbFt+YnjvgMhgwEZegcHUM2t4qedH4nXoi4ybxM0AcqvPw6FN18Gvm04FbzhGQgMsDl
         7KOhHkWl7eIoCupVC7GfdLD+mQcQcJ9Rw8GBA88T7L1HUg3R4l86kWqlgzf54NU3Z/R2
         06KiFdgZzlHy+1K4GCUHN+rnmEGdbeI4UQts86IDCLGQ7G5SZdc/ArD//XfBOm9OHpjE
         ymZQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUpbCyQ94E6E074dQob8wbJvae3J4BZcmM6fF5zKuXaaTAaZdz1
	cgP/HOYbNgY6g4mTlJOb0y8=
X-Google-Smtp-Source: APXvYqxn16aZq+44G5SwrYSMEdZ5DktMKNL3qk83IwDd8rJe2S66qzwIiQuPE1ZnkJ8gTEehnVIH/w==
X-Received: by 2002:a05:6830:15d2:: with SMTP id j18mr7533584otr.187.1580248210795;
        Tue, 28 Jan 2020 13:50:10 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:a0a:: with SMTP id n10ls2599447oij.0.gmail; Tue, 28
 Jan 2020 13:50:10 -0800 (PST)
X-Received: by 2002:aca:dfd5:: with SMTP id w204mr4428558oig.95.1580248210058;
        Tue, 28 Jan 2020 13:50:10 -0800 (PST)
Date: Tue, 28 Jan 2020 13:50:09 -0800 (PST)
From: Saroj Sapkota <samirroj2016@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <aef00f02-8d3b-4916-aace-f30233559859@googlegroups.com>
Subject: mem_region_request failed for hypervisor memory in jetson-tx2 kit
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_514_1477578744.1580248209295"
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

------=_Part_514_1477578744.1580248209295
Content-Type: multipart/alternative; 
	boundary="----=_Part_515_218264144.1580248209295"

------=_Part_515_218264144.1580248209295
Content-Type: text/plain; charset="UTF-8"

I'm trying to run jailhouse on Jetson tx2 kit. I downloaded the jailhouse 
and compiled it and run the command 

=>sudo insmod Downloads/linux-jailhouse-jetson/driver/jailhouse.ko 

// there is no error message in terminal console

but it gives following output on the serial console:

tx2@tx2-desktop:~$ [  129.954491] jailhouse: loading out-of-tree module 
taints kernel.

After this I tried to enable jailhouse through this command

=>sudo jailhouse enable Downloads/linux-jetson/configs/arm64/jetson-tx2.cell
// terminal displays: JAILHOUSE_ENABLE: Invalid argument 

//and on the terminal console it displays:

[  333.421533] jailhouse: mem_region_request failed for hypervisor memory 
mem_region_request failed for hypervisor memory mem_region_request failed 
for hypervisor memory mem_region_request failed for hypervisor memory.
[  333.428303] jailhouse: Did you reserve the memory with "memmap=" or 
"mem="?

I have changed /boot/extlinux/extlinux.conf file as follows:
TIMEOUT 30
DEFAULT primary

MENU TITLE L4T boot options

LABEL primary
      MENU LABEL primary kernel
      LINUX /boot/Image
      INITRD /boot/initrd
      APPEND ${cbootargs} quiet
*mem=7808M vmalloc=512M*
# When testing a custom kernel, it is recommended that you create a backup 
of
# the original kernel and add a new entry to this file so that the device 
can
# fallback to the original kernel. To do this:
#
# 1, Make a backup of the original kernel
#      sudo cp /boot/Image /boot/Image.backup
#
# 2, Copy your custom kernel into /boot/Image
#
# 3, Uncomment below menu setting lines for the original kernel
#
# 4, Reboot

# LABEL backup
#    MENU LABEL backup kernel
#    LINUX /boot/Image.backup
#    INITRD /boot/initrd
#    APPEND ${cbootargs}

but this change is not working. So what's the wrong in this extlinux.conf 
file as boot up is ignoring *mem=7808M vmalloc=512M *this statement.
Please help me through this error.
Thank you

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/aef00f02-8d3b-4916-aace-f30233559859%40googlegroups.com.

------=_Part_515_218264144.1580248209295
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m trying to run jailhouse on Jetson tx2 kit. I =
downloaded the jailhouse and compiled it and run the command <br></div><div=
><br></div><div>=3D&gt;sudo insmod Downloads/linux-jailhouse-jetson/driver/=
jailhouse.ko <br></div><div><br></div><div>// there is no error message in =
terminal console</div><div><br></div><div>but it gives following output on =
the serial console:</div><div><br></div><div>tx2@tx2-desktop:~$ [=C2=A0 129=
.954491] jailhouse: loading out-of-tree module taints kernel.</div><div><br=
></div><div>After this I tried to enable jailhouse through this command</di=
v><div><br></div><div>=3D&gt;sudo jailhouse enable Downloads/linux-jetson/c=
onfigs/arm64/jetson-tx2.cell</div><div> // terminal displays: JAILHOUSE_ENA=
BLE: Invalid argument <br></div><div><br></div><div>//and on the terminal c=
onsole it displays:<br></div><div><br>[=C2=A0 333.421533] jailhouse: mem_re=
gion_request failed for hypervisor memory mem_region_request failed for hyp=
ervisor memory mem_region_request failed for hypervisor memory mem_region_r=
equest failed for hypervisor memory.<br>[=C2=A0 333.428303] jailhouse: Did =
you reserve the memory with &quot;memmap=3D&quot; or &quot;mem=3D&quot;?</d=
iv><div><br></div><div>I have changed /boot/extlinux/extlinux.conf file as =
follows:</div><div>TIMEOUT 30<br>DEFAULT primary<br><br>MENU TITLE L4T boot=
 options<br><br>LABEL primary<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MENU LABEL =
primary kernel<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LINUX /boot/Image<br>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 INITRD /boot/initrd<br>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 APPEND ${cbootargs} quiet<br><b><b>mem=3D7808M vmalloc=3D512M</b></b=
><br># When testing a custom kernel, it is recommended that you create a ba=
ckup of<br># the original kernel and add a new entry to this file so that t=
he device can<br># fallback to the original kernel. To do this:<br>#<br># 1=
, Make a backup of the original kernel<br>#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
udo cp /boot/Image /boot/Image.backup<br>#<br># 2, Copy your custom kernel =
into /boot/Image<br>#<br># 3, Uncomment below menu setting lines for the or=
iginal kernel<br>#<br># 4, Reboot<br><br># LABEL backup<br>#=C2=A0=C2=A0=C2=
=A0 MENU LABEL backup kernel<br>#=C2=A0=C2=A0=C2=A0 LINUX /boot/Image.backu=
p<br>#=C2=A0=C2=A0=C2=A0 INITRD /boot/initrd<br>#=C2=A0=C2=A0=C2=A0 APPEND =
${cbootargs}<b><br></b></div><div><b><br></b></div><div>but this change is =
not working. So what&#39;s the wrong in this extlinux.conf file as boot up =
is ignoring <b>mem=3D7808M vmalloc=3D512M </b>this statement.<b><br></b></d=
iv><div>Please help me through this error.<br></div><div>Thank you<br></div=
></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/aef00f02-8d3b-4916-aace-f30233559859%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/aef00f02-8d3b-4916-aace-f30233559859%40googlegroups.com<=
/a>.<br />

------=_Part_515_218264144.1580248209295--

------=_Part_514_1477578744.1580248209295--
