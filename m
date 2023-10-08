Return-Path: <jailhouse-dev+bncBDK2NDXEWICBB2NSRGUQMGQEVPQGWSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33c.google.com (mail-ot1-x33c.google.com [IPv6:2607:f8b0:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD197BCD06
	for <lists+jailhouse-dev@lfdr.de>; Sun,  8 Oct 2023 09:25:31 +0200 (CEST)
Received: by mail-ot1-x33c.google.com with SMTP id 46e09a7af769-6c660a0f0e8sf4538969a34.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 08 Oct 2023 00:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1696749930; x=1697354730; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AI9VzaTSMMCGNNnwLwm3OqmYSBF5EljHRTjoToGz4CI=;
        b=b8a2q3pB3BglSXjtW2l5jhFvtHWB2TTSljWa3oGaRqGmHszyySd7w0WPoe56w785lS
         fdjXVoj9vRcuxieeFA0NghOF30JHs4hlLTBOuuGH35tH5X/JGRY2MVcM0GMxJyvB63+Q
         TPnEENMo3BXMKTF9iFteg8ByNj9B/TEtKQ4cd5uwvddN4afeD80ARDkX++qTCCFem2fP
         jwu+eQAP/bqO8AGlP0R/IUwNG0SpBpKv6wsvXg14Gd08vWp/DMMDTAP2rHf8QyL9ESo8
         bwCM2Roax8SMEA1gdfHPP/60+SQ+Y9Wwys1fjs+SABkRE3tW5naJPUok8v7RVYvH0T3z
         tIew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696749930; x=1697354730; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AI9VzaTSMMCGNNnwLwm3OqmYSBF5EljHRTjoToGz4CI=;
        b=TIbNBxUVYit/YHhMl6tvWSiXVTssL74xKp5KfgYZ4FQCWGrD8cVYwzW4JZF2rbmnBq
         E2xfu/TTen734nYcEONmj3Qxyw6SDWMQVEAOwgAKVhqdRWvS7W1f/cWjTCTZFhD6XrKx
         0hT02Xsw2+BNPvS6cfjDjBk0DaU/vKPOIzsHxjblA0o5z/5JCVGM/1ipBPksiLLgyyx2
         XbB/3kwYLVtiPP4M6W4LbqYRf2Emw0d8Yx/vT14g16J9n9bIw+VaWJ27e7L/v9burDRQ
         PrhCIukjUpE875gcPiD97+sf/6t/BMKFgEjGd+VQx4huchSVu0A7ezTksnqu/vzjARYz
         MfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696749930; x=1697354730;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AI9VzaTSMMCGNNnwLwm3OqmYSBF5EljHRTjoToGz4CI=;
        b=pd/K/RfFiZ0bgLO/xm+uKOF6ADVc/bKzvDL3HH5k6ISOwpBAQAsyL3sx/lecuo7gVl
         YYrgKK0Azq/fRNk+TIi2aA6IqBd3AyNBXxM5E4bfjVUI5kigGNiJW3jJjfybTL3eE0A/
         clet1/sRixT86nUo9LAfDpYzDUkssKsamnfFrU+ps9UVw1gBHAn8MEqN8raftcVtnWR1
         xJanHMd9yl5q/tOP2BSXu9mLAr5X/QvQaZaQ1Q1PrU+JYYjtdWUF0SwsAyuzTWhBxqwX
         gzP3LhZWceYnba+vdV/oy+78qrjWy4aki5FsNn/qQDjC2Ef4nSHf4MVlOz912E5eAj3N
         HP4A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YydB/NoFuOMXZix8xbrl2Pn/GBcZWKYulSplTh2Te1INWrMLOd+
	hkrwJ2jrNGoCX46lh+EKHcc=
X-Google-Smtp-Source: AGHT+IFYkx3vvoBX77iaHsnwIFjBF1Kq3pi8l/WWzmFzmtBSrUK2ggjiMSaXPsFobe3dVaP2+WTUKw==
X-Received: by 2002:a9d:6c85:0:b0:6c6:19a6:29bf with SMTP id c5-20020a9d6c85000000b006c619a629bfmr13666835otr.7.1696749930489;
        Sun, 08 Oct 2023 00:25:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a4a:4f4a:0:b0:57b:6ab1:a1f8 with SMTP id c71-20020a4a4f4a000000b0057b6ab1a1f8ls2317637oob.2.-pod-prod-08-us;
 Sun, 08 Oct 2023 00:25:29 -0700 (PDT)
X-Received: by 2002:a9d:6b18:0:b0:6c4:b0e7:7403 with SMTP id g24-20020a9d6b18000000b006c4b0e77403mr4015080otp.6.1696749929174;
        Sun, 08 Oct 2023 00:25:29 -0700 (PDT)
Date: Sun, 8 Oct 2023 00:25:28 -0700 (PDT)
From: z ws <wszlight@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <9773370c-619a-47c7-a0fb-522217cc6fa9n@googlegroups.com>
Subject: =?UTF-8?Q?HELP=EF=BC=9Ahaving_trouble_using_virtio_console?=
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_97265_768962921.1696749928365"
X-Original-Sender: wszlight@gmail.com
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

------=_Part_97265_768962921.1696749928365
Content-Type: multipart/alternative; 
	boundary="----=_Part_97266_2026482399.1696749928365"

------=_Part_97266_2026482399.1696749928365
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi=EF=BC=8Call

when i use virtio console, i ran into a problem.
in root cell : insmod uio_ivshmem.ko
            echo "110a 4106 110a 4106 ffc003 ffffff" >                     =
=20
   /sys/bus/pci/drivers/uio_ivshmem/new_id
            then ./virtio-ivshmem-console /dev/uio0
then i start non root cell linux=20
(CONFIG_VIRTIO_CONSOLE=3Dy/CONFIG_VIRTTIO_IVSHMEM=3Dy),but i can not use it=
=20
like a serial console. The virtio-ivshmem-console print some status,and=20
then there has no input and output.

this is the virtio-ivshmem-console output:
Starting virtio device
device_status: 0x0
device_status: 0x1
device_status: 0x3
device_features_sel: 1
device_features_sel: 0
driver_features_sel: 1
driver_features[1]: 0x13
driver_features_sel: 0
driver_features[0]: 0x1
device_status: 0xb
queue_sel: 0
queue size: 8
queue driver vector: 0
queue desc: 0x200
queue driver: 0x280
queue device: 0x2c0
queue enable: 1
queue_sel: 1
queue size: 8
queue driver vector: 0=20
queue desc: 0x400
queue driver: 0x480
queue device: 0x4c0
queue enable: 1
device_status: 0xf

queue driver vector: 0 is different with demo, Where do I start=20
troubleshooting?

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9773370c-619a-47c7-a0fb-522217cc6fa9n%40googlegroups.com.

------=_Part_97266_2026482399.1696749928365
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi=EF=BC=8Call<br /><br />when i use virtio console, i ran into a problem.<=
br />in root cell : insmod uio_ivshmem.ko<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 echo "110a 4106 110a 4106 ffc003 ffffff" &gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/sys/bus/pci/drivers/uio_ivshmem/new_id<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 then ./virtio-ivshmem-console /dev/uio0<br />then i start no=
n root cell linux (CONFIG_VIRTIO_CONSOLE=3Dy/CONFIG_VIRTTIO_IVSHMEM=3Dy),bu=
t i can not use it like a serial console. The virtio-ivshmem-console print =
some status,and then there has no input and output.<br /><br />this is the =
virtio-ivshmem-console output:<br />Starting virtio device<br />device_stat=
us: 0x0<br />device_status: 0x1<br />device_status: 0x3<br />device_feature=
s_sel: 1<br />device_features_sel: 0<br />driver_features_sel: 1<br />drive=
r_features[1]: 0x13<br />driver_features_sel: 0<br />driver_features[0]: 0x=
1<br />device_status: 0xb<br />queue_sel: 0<br />queue size: 8<br />queue d=
river vector: 0<br />queue desc: 0x200<br />queue driver: 0x280<br />queue =
device: 0x2c0<br />queue enable: 1<br />queue_sel: 1<br />queue size: 8<br =
/>queue driver vector: 0 <br />queue desc: 0x400<br />queue driver: 0x480<b=
r />queue device: 0x4c0<br />queue enable: 1<br />device_status: 0xf<br /><=
br />queue driver vector: 0 is different with demo, Where do I start troubl=
eshooting?<br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/9773370c-619a-47c7-a0fb-522217cc6fa9n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/9773370c-619a-47c7-a0fb-522217cc6fa9n%40googlegroups.co=
m</a>.<br />

------=_Part_97266_2026482399.1696749928365--

------=_Part_97265_768962921.1696749928365--
