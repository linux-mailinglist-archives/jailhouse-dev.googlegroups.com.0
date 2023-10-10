Return-Path: <jailhouse-dev+bncBDKLL2HKV4DRBCWWSWUQMGQE23D763A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x140.google.com (mail-il1-x140.google.com [IPv6:2607:f8b0:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1E37C0034
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Oct 2023 17:17:33 +0200 (CEST)
Received: by mail-il1-x140.google.com with SMTP id e9e14a558f8ab-351592255cesf46130655ab.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Oct 2023 08:17:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1696951051; cv=pass;
        d=google.com; s=arc-20160816;
        b=kDz9KHy73VbjQaqzFwDSLggMoRyXB8d7+9tEI3xXqnaIxFECwOlsGaberQvwHr/WTt
         P3XxHjUt+b0JZCovs/QbUpZg687cVX84WUJnBb92v/VsFTqghO7GEPLteRzm3GVhVE99
         cKQJLvPTYLdKcoYYLuHz1sMlmVk3he5o8ygSEFcypK21v1xBTza3LWOv9nvfXeSQ+zJ8
         xPirzl0LdlLwKmYAoJ2TS4bavIlO4CCqfZLNws4bQXBUzn/OyykAU2B1+OVVVvRxtJEt
         ChB5oYpv+NA97PKrj8tQDL6yhjIWXM1Ah7gHjkNqvH7i4E3drnTeXyooXRWuuIrGlrjj
         pq4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=CP3iqmjOHHT3+rtEmfvVJGAwEDRMbWNYeMlar4UV5TI=;
        fh=2tQzQ7BDCTqJm82PDY7f/SoNACc8xWmtm+Icohy5zLg=;
        b=034xMzYd/XDwUFEaJaDaRv9Vm8nM9yVYEcofO41UqjqdwrLZbM357Rz6Wh61IP68mL
         WqO9fiJpIvlf/3JSyyYP2ls/P547KtwFw3Y61LwmQQWHx4K+RqjaBOC5UUDptQRWgKJZ
         OeNrMFH8RP5/qmzZLYXUeEW3UotxeRKAwdmlN2uXN38zusHBqnrv4sYbIjCWm6FKl4g4
         TD258eH0GfJvRoKn34J201o+4GMHO1wmueI1AfKNcNCQ56TIIU14baPGx5I1N+w3yS+v
         0m//52+CVKiyPjewc7kgHN3SibAXulmiKv63Qjl15IBs9KwSP+BHVXn4mexyXktLtIG6
         TA2w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=LBaIG+JS;
       spf=pass (google.com: domain of barathiraja@gmail.com designates 2607:f8b0:4864:20::112b as permitted sender) smtp.mailfrom=barathiraja@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1696951051; x=1697555851; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=CP3iqmjOHHT3+rtEmfvVJGAwEDRMbWNYeMlar4UV5TI=;
        b=UiDeelSwOEyAO7X5m7OWEM3wPkTggwgWK8K56FdCsNerBNJsMk5D/NQLcG9p6lvyut
         3vKPR6hgnIcgP5KcZQK++Y51NtCL3zQzNhJbLXgJOUDC9u/qejAvcYtFYwHBz4FVou0j
         oWUtYPil2xepg7PxazFEqW8agSa/eI11tuhOyhCl+82bS6nL/RpWDnK/9XNP8z3ObzVP
         6zNKaxeHLu2hLkN4ZZbIWTn+pNI35la2CbNIJ/47OkOxNrvA65wWibIARFgd5ggB3pTG
         G/iqUBktoMkY8fJCB4I+F+JvLdPGTCqCmOribPDZBtqnFkTPyjAlxB+ijqwCjd2h8Iux
         +4fA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696951051; x=1697555851; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CP3iqmjOHHT3+rtEmfvVJGAwEDRMbWNYeMlar4UV5TI=;
        b=Trn1m96j61YSLLh9vwrxMfuA9B1zZnn+tF+r3HVk76S6v3CrXKbwYNzPM1DUF/I/Hm
         azzDowe4myE/JEWzVAqrLMNKW55Z+YmiofVIvEpYgKSJ9Ly0JBF3lTQ9D8QgKndBaNR9
         mu6Zbc/xtTJ8nEr/6Fuksq6dTnFk0q+qmLBsmeKMQjHep20Qv4eCLxSZ+6h015siQk94
         jGIMRxE8Z2YgaLpI5YfHRRRx2I/q3dprpbfw0o0x63CrhmSfstsj8SRFAiWDTGPOnoYm
         mdiyblrA/Vbif9PSz/5+OvqkV+rB5SlLi4d4wkbKBdT1Wie0iWZA4G+P50F22oUshkuY
         xAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696951051; x=1697555851;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to:subject
         :message-id:date:from:mime-version:x-beenthere:x-gm-message-state
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=CP3iqmjOHHT3+rtEmfvVJGAwEDRMbWNYeMlar4UV5TI=;
        b=Yz0ZLpt5HdA8P/5lHDCrdTMmKDTHndHljSDm5A+bB7k+bjUjIQXNqjNFt4FyV+ZEXb
         5ZD9kqCA78cK4ERy2EXXVN96IjfBkn7BDYGPEq5eNSVGSZUmy7xNiYPBsGGrBb3e+Vpp
         /We53IOcDErMNKNtBAw8yOwMj+5N8q7YMPFzUW+ILCHny13wYSObTsLerKxsT5VfvKLc
         EElsHkQYwWrGVLPcXTKBR7gkQRNoSojCaVc9qk2jHEhO1Zaje58QDFEx9LNmdzXUnziR
         hXT2cCZRHFZEZRBpM2bf3OMpcq5RD6O3mp4khQAC+23h/IGtZ13KNjgv6h1aOnpqYNMw
         VllA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwmN6DWaTGJqHCynhnc/VJsmz9ZsE5OfhhG8WVpnTRkYKRm4NTf
	bdZRm1VDj7y3s1Ykw7kheTQ=
X-Google-Smtp-Source: AGHT+IGUrpmP2Xmgm39Hm7s7o7XJSi9vx1j9hXUQ1dMzoTodK2iQryvcmN/l0RsXpAQ86Vi/skFggg==
X-Received: by 2002:a05:6e02:f45:b0:357:478f:a744 with SMTP id y5-20020a056e020f4500b00357478fa744mr438113ilj.10.1696951051208;
        Tue, 10 Oct 2023 08:17:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:3409:0:b0:352:6621:64a9 with SMTP id b9-20020a923409000000b00352662164a9ls534429ila.0.-pod-prod-01-us;
 Tue, 10 Oct 2023 08:17:29 -0700 (PDT)
X-Received: by 2002:a05:6602:22c5:b0:7a2:a8d5:e146 with SMTP id e5-20020a05660222c500b007a2a8d5e146mr21353132ioe.15.1696951049410;
        Tue, 10 Oct 2023 08:17:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696951049; cv=none;
        d=google.com; s=arc-20160816;
        b=fO5+T/tnYAo8QxU+1OWPUv/jZyQs+lKHMsSgonaa5COKMidt7+hMF5FDO0iV4ld85t
         5l+ud0i/P3w872JCeLSuBwF2/GXmwJvrOSYWusthIJ/Peob7MtP6xr9oINdFKRp8Yd4E
         ECNKA0u6c/hg2mGhVBROJIYTd9XUdLvRGnNjsHAVmbNcj04/LD359wizdb5uG7WuAKEB
         +TioYgtuP3ZSUbAlzoQAKoFXKfpOFOg3ZJvnIzCEJCaWo/sV0igMuNogXrRt2Ee1WgZD
         f0ZJW4wCJ/PY/iSh3dpoVqkQ+RFnljO7UFr16w+RYOuhNul59YbbnkjBfQ1Sm39gO6j5
         vrTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=FBjLMOVcZ1TwmqKwDUy7UznouKy+SnXHcVJSFy2UKZc=;
        fh=2tQzQ7BDCTqJm82PDY7f/SoNACc8xWmtm+Icohy5zLg=;
        b=KdooUffBDli7+U2WZhA9RAo2/TdVFaPYQMTd+oB7rsYb/XuBBbiC8+Jht8+yO0Mbd6
         CA6mPkd4eYCLOp01UZJK8A/18+zBTjCLnN82aJryLPFNQ1DL68biaoVEXYwA74nrVl79
         AI+Ye5IKe73qJSl0NfVe53crQe9sgLiColCALwD8qK9Gm6BEn7GTzaDPzmxCQrPCE8x1
         ECLSQT9/KbAnz+V0Jp819aw05jzezCSqc0YfMGQra2ZagsEPspLErhQ7Ar6VrD8dN6cK
         oPN+H8ayuIXNNPX+J+vBzv5rc2gz60HA1OLHCUp/KJhWONUQC6Ob9XTCXP1bwfBJtWAF
         rGwA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=LBaIG+JS;
       spf=pass (google.com: domain of barathiraja@gmail.com designates 2607:f8b0:4864:20::112b as permitted sender) smtp.mailfrom=barathiraja@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com. [2607:f8b0:4864:20::112b])
        by gmr-mx.google.com with ESMTPS id eh14-20020a0566024a0e00b00792153b2901si449114iob.4.2023.10.10.08.17.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 08:17:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of barathiraja@gmail.com designates 2607:f8b0:4864:20::112b as permitted sender) client-ip=2607:f8b0:4864:20::112b;
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5a7c93507d5so6272067b3.2
        for <jailhouse-dev@googlegroups.com>; Tue, 10 Oct 2023 08:17:29 -0700 (PDT)
X-Received: by 2002:a0d:d7c2:0:b0:5a7:cc02:68b0 with SMTP id
 z185-20020a0dd7c2000000b005a7cc0268b0mr1192797ywd.23.1696951048578; Tue, 10
 Oct 2023 08:17:28 -0700 (PDT)
MIME-Version: 1.0
From: Bharathiraja Nallathambi <barathiraja@gmail.com>
Date: Tue, 10 Oct 2023 20:47:17 +0530
Message-ID: <CAGA=GbzmH9eiuBrKjVeeKf--5fRFVGxwyCe6D20e4MDn66d3tw@mail.gmail.com>
Subject: CPU shows offline - Jailhouse Linux inmate
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="00000000000073abe506075e3458"
X-Original-Sender: barathiraja@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20230601 header.b=LBaIG+JS;       spf=pass
 (google.com: domain of barathiraja@gmail.com designates 2607:f8b0:4864:20::112b
 as permitted sender) smtp.mailfrom=barathiraja@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--00000000000073abe506075e3458
Content-Type: text/plain; charset="UTF-8"

Hi,

I was trying jailhouse with a linux inmate on an imx8mp-evk board. I have
created a yocto build with jailhouse and linux kernel 6.1.22-rt8 which is
having the patches for real time linux.
Booted the board with running run '*jh_mmcboot*' in the uboot prompt.

 Once logged into the device, I have started the jailhouse by  running,

* cd /usr/share/jailhouse/scripts && ./init_jailhouse_env.sh && cp
/run/media/boot-mmcblk1p1/Image /usr/share/jailhouse/inmates/kernel/ &&
../tools/jailhouse enable ../cells/imx8mp.cell; jailhouse cell list;*

 the above command will load the jailhouse.ko and will enable the jailhouse

I got the output of 'jailhouse cell list' as,


* root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# jailhouse cell list
ID      Name                    State             Assigned CPUs
Failed CPUs              0       imx8mp                  running
0-3  *

 Then I started the linux inmate, the CPU offset in the cell configuration
is 0xc which will assign two cores. I am using the same host kernal image
for the inmate also (6.1.22-rt8). Used the below command to start the inmate

../tools/jailhouse cell linux ../cells/imx8mp-linux-demo.cell
../inmates/kernel/Image -d ../inmates/dtb/inmate-imx8mp-evk.dtb -c
"clk_ignore_unused console=ttymxc3,115200
earlycon=ec_imx6q,0x30890000,115200 root=/dev/mmcblk2p2 rootwait rw";
jailhouse cell list;

 I got the output of 'jailhouse cell list' as,




* root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# jailhouse cell list
ID      Name                    State             Assigned CPUs
Failed CPUs              0       imx8mp                  running
0-1                                              1
linux-inmate-demo       running           2-3   *

 I could login to the inmate using serial console. But the output of 'cat
/proc/cpuinfo' is showing only one core.









* root@imx8mp-lpddr4-evk:~# cat /proc/cpuinfo   processor       : 0
BogoMIPS        : 16.66 Features        : fp asimd evtstrm aes pmull sha1
sha2 crc32 cpuid CPU implementer : 0x41 U architecture: 8 CPU variant     :
0x0 CPU part        : 0xd03 CPU resion      : 4*



the 'nproc --all' is giving 2

 It looks like 2 cores are assigned to the inmate but one of the core is
offline.

* root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# cat
/sys/devices/system/cpu/cpu0/online *



* 1 root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# cat
/sys/devices/system/cpu/cpu1/online  0*

 Am I doing something wrong? How can I turn on both the CPUS for the inmate.


Thanks and Regards,
Bharathiraja Nallathambi

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAGA%3DGbzmH9eiuBrKjVeeKf--5fRFVGxwyCe6D20e4MDn66d3tw%40mail.gmail.com.

--00000000000073abe506075e3458
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span class=3D"gmail-ui-provider ec gmail-ccg gmail-bhp gm=
ail-bhq gmail-bhr gmail-bhs gmail-bht gmail-bhu gmail-bhv gmail-bhw gmail-b=
hx gmail-bhy gmail-bhz gmail-bia gmail-bib gmail-bic gmail-bid gmail-bie gm=
ail-bif gmail-big gmail-cch gmail-cci gmail-bij gmail-bik gmail-bil gmail-b=
im gmail-bin gmail-bio gmail-bip gmail-biq gmail-bir gmail-bis gmail-bit gm=
ail-biu gmail-biv" dir=3D"ltr"><p>Hi,</p><p>I was trying jailhouse with a l=
inux inmate on an imx8mp-evk board. I have created a yocto build with jailh=
ouse and linux kernel 6.1.22-rt8 which is having the patches for real time =
linux.<br>
Booted the board with running run &#39;<i>jh_mmcboot</i>&#39; in the uboot =
prompt.</p><p>=C2=A0Once logged into the device, I have started the jailhou=
se by=C2=A0 running,</p><p><i>
cd /usr/share/jailhouse/scripts &amp;&amp; ./init_jailhouse_env.sh &amp;&am=
p; cp /run/media/boot-mmcblk1p1/Image /usr/share/jailhouse/inmates/kernel/ =
&amp;&amp; ../tools/jailhouse enable ../cells/imx8mp.cell; jailhouse cell l=
ist;</i></p><p>=C2=A0the above command will load the jailhouse.ko and will =
enable the jailhouse</p><p>
I got the output of &#39;jailhouse cell list&#39; as,<br><i>
root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# jailhouse cell list<br=
>
ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 State=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Assigned CPUs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Failed CPUs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0<br>
0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 imx8mp=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ru=
nning=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0-3=C2=A0=
=C2=A0</i></p><p>=C2=A0Then I started the linux inmate, the CPU offset in t=
he cell configuration is 0xc which will assign two cores. I am using the sa=
me host kernal image for the inmate also (6.1.22-rt8). Used the below comma=
nd to start the inmate</p><p>
../tools/jailhouse cell linux ../cells/imx8mp-linux-demo.cell ../inmates/ke=
rnel/Image -d ../inmates/dtb/inmate-imx8mp-evk.dtb -c &quot;clk_ignore_unus=
ed console=3Dttymxc3,115200 earlycon=3Dec_imx6q,0x30890000,115200 root=3D/d=
ev/mmcblk2p2 rootwait rw&quot;; jailhouse cell list;</p><p>=C2=A0I got the =
output of &#39;jailhouse cell list&#39; as,</p><p><i>
root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# jailhouse cell list<br=
>
ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 State=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Assigned CPUs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Failed CPUs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0<br>
0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 imx8mp=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ru=
nning=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0-1=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>
1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 linux-inmate-demo=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 running=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2-3=C2=A0=C2=A0=C2=A0</i></p><p>=C2=A0I could login to the inm=
ate using serial console. But the output of &#39;cat /proc/cpuinfo&#39; is =
showing only one core.</p><p><i>
root@imx8mp-lpddr4-evk:~# cat /proc/cpuinfo=C2=A0=C2=A0<br>
processor=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 0<br>
BogoMIPS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 16.66<br>
Features=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : fp asimd evtstrm aes p=
mull sha1 sha2 crc32 cpuid<br>
CPU implementer : 0x41<br>
U architecture: 8<br>
CPU variant=C2=A0=C2=A0=C2=A0=C2=A0 : 0x0<br>
CPU part=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 0xd03<br>
CPU resion=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 4</i></p><p>=C2=A0</p><p>the &#3=
9;nproc --all&#39; is giving 2</p><p>=C2=A0It looks like 2 cores are assign=
ed to the inmate but one of the core is offline.</p><p><i>=C2=A0root@imx8mp=
-lpddr4-evk:/usr/share/jailhouse/scripts# cat /sys/devices/system/cpu/cpu0/=
online=C2=A0</i></p><p><i>
1<br>
root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# cat /sys/devices/syste=
m/cpu/cpu1/online=C2=A0<br>
0</i></p><p>=C2=A0Am I doing something wrong? How can I turn on both the CP=
US for the inmate.</p><p>=C2=A0</p></span><div dir=3D"ltr" class=3D"gmail_s=
ignature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Thanks and Re=
gards,<div>Bharathiraja Nallathambi</div></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAGA%3DGbzmH9eiuBrKjVeeKf--5fRFVGxwyCe6D20e4MDn66d=
3tw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAGA%3DGbzmH9eiuBrKjVeeKf--5fRFVGxwyCe6D2=
0e4MDn66d3tw%40mail.gmail.com</a>.<br />

--00000000000073abe506075e3458--
