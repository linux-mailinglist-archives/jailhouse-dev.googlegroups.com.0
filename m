Return-Path: <jailhouse-dev+bncBDK2NDXEWICBBAWHRGUQMGQEXBVSPDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33d.google.com (mail-ot1-x33d.google.com [IPv6:2607:f8b0:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FCA7BCD2D
	for <lists+jailhouse-dev@lfdr.de>; Sun,  8 Oct 2023 10:08:35 +0200 (CEST)
Received: by mail-ot1-x33d.google.com with SMTP id 46e09a7af769-6c4b9cab821sf4945742a34.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 08 Oct 2023 01:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1696752514; x=1697357314; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X69DBAlnMxD7FUwIbKpQMPo1iqDXhcoiCrTZnUcHhBQ=;
        b=b9xO85NDb9E0GW9m1sr5zWwvakzEozTjsoywkrF/MsnPd5TaD4dNoM+2bBhR8yOkev
         /uObbVezBG5ikEO/8klrbnxRW865Ohfz/FjhNLYhgFMKLcrPUAuC1CkWPuIEGDtBlX6p
         ksiIoZa0rsal41gRB19Glg3S8qu9lDGk6vIRhe+7uBflqoooNt8qNvBOP+tpGFhYkQIH
         Lza6Z+Ep1nUPmJMGnDhkxjva82VxhWiLasFFPj8Ug0OQV8TMNmoxlRACJDC59j+lqw+A
         aGIKL5/hQ5rCpyTEsI7jez0oZjc6K5joS3zJcyMX4JZc1QoVHRoJwWLkvCgd20LaoWwY
         a5gQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696752514; x=1697357314; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X69DBAlnMxD7FUwIbKpQMPo1iqDXhcoiCrTZnUcHhBQ=;
        b=JPluXnfiLaYKRNvvXs3EcwIjFf+A4gNof/UVPJr6LFRquxH0tcG0ZNmyLtTDOlvkJr
         lhqj9192hWcBC1vng8zaAnPqlX6CF359+lTwVwsjdTM3+TvcWe8yphWkRa3UsDjOv7Z5
         Ncku8FziJa2uM+BhddpYxEnh0RCeYx0a1acQQT/Ubp+c0zshfmcYlw0gFT6Ml9uXj5/Y
         wNCAaliD/SQZyEger0Gw1kQQ8RDq/w96apuIj+lXDr1omlz0wvmwu1B4iB5FXjM5sMcu
         MiNAjcvR4sKmcUfFPCIkDAR18XtXl0+kNI84dP0KPDR3yvpnabQ0hqWmHcm9zKt/4J0f
         zugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696752514; x=1697357314;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X69DBAlnMxD7FUwIbKpQMPo1iqDXhcoiCrTZnUcHhBQ=;
        b=R96ojIg45gmREPeXDOm8YpG42a0N967MXXV2LhQVxwpMdGvZ9RayLt0PxIMOfUzRXk
         MtWFf7BdhuVD72XmYsGSXYCIBCKo+Q3tkncccZ+xT6DG+ZFBP0encpNY5oTs/3Olvvs7
         lrlP0wvgyloifs93WRl3pxFJteoh2aC/GQ/DdPNhz03TS6BSc0NdsYoMxyUC6XmfP7Rj
         fLIO7nHzu9RqPeb55ugC8HyZRsUL/nwc6vMnmVMxE1FHIDprmCkzNW29bxZPXQsHrRWi
         +y3XceHB4ZdzkrgEko1XLo3ViF4Fg4PfKgLzIKAO9gwBtXJI4peKF+8cZA9bgB1buepK
         LCbA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwXzc2JPc5NImUGvWIVbS1UnQKcf5WO4jlaq0QQ45UnGMhYjmPJ
	wL7RNpmgfndOGh+krCErFBU=
X-Google-Smtp-Source: AGHT+IHmJsOMXNZ4x4vuWf9NvMwE/mILc6UamRbnvVtiTZ2T0nP/ATFgFlExB1vRmXXZ+Bp7g0XOIQ==
X-Received: by 2002:a9d:7e87:0:b0:6bc:b80c:bd53 with SMTP id m7-20020a9d7e87000000b006bcb80cbd53mr12419069otp.38.1696752514349;
        Sun, 08 Oct 2023 01:08:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a4a:4147:0:b0:57e:584c:a4d3 with SMTP id x68-20020a4a4147000000b0057e584ca4d3ls1656408ooa.2.-pod-prod-00-us;
 Sun, 08 Oct 2023 01:08:33 -0700 (PDT)
X-Received: by 2002:a05:6808:913:b0:3af:8f64:1810 with SMTP id w19-20020a056808091300b003af8f641810mr3037588oih.2.1696752513462;
        Sun, 08 Oct 2023 01:08:33 -0700 (PDT)
Date: Sun, 8 Oct 2023 01:08:32 -0700 (PDT)
From: z ws <wszlight@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <fcde5e93-afba-4903-8c71-76cf965f7c5an@googlegroups.com>
In-Reply-To: <f3e147bd-9384-4ba0-b03f-bff46288878cn@googlegroups.com>
References: <9773370c-619a-47c7-a0fb-522217cc6fa9n@googlegroups.com>
 <f3e147bd-9384-4ba0-b03f-bff46288878cn@googlegroups.com>
Subject: =?UTF-8?Q?Re:_HELP=EF=BC=9Ahaving_trouble_using_virtio_console?=
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_13163_810778024.1696752512874"
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

------=_Part_13163_810778024.1696752512874
Content-Type: multipart/alternative; 
	boundary="----=_Part_13164_1040544435.1696752512874"

------=_Part_13164_1040544435.1696752512874
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

i=E2=80=98m in linux 5.10 =EF=BC=8Cand in non root  cell   echo "Your messa=
ge" | tee=20
/dev/kmsg
root cell  virtio-ivshmem-console can see :  [  761.955026] Your message
=E5=9C=A82023=E5=B9=B410=E6=9C=888=E6=97=A5=E6=98=9F=E6=9C=9F=E6=97=A5 UTC+=
8 15:46:01<z ws> =E5=86=99=E9=81=93=EF=BC=9A

> non root cell start with console=3Dhvc0
>
> =E5=9C=A82023=E5=B9=B410=E6=9C=888=E6=97=A5=E6=98=9F=E6=9C=9F=E6=97=A5 UT=
C+8 15:25:28<z ws> =E5=86=99=E9=81=93=EF=BC=9A
>
>> Hi=EF=BC=8Call
>>
>> when i use virtio console, i ran into a problem.
>> in root cell : insmod uio_ivshmem.ko
>>             echo "110a 4106 110a 4106 ffc003 ffffff" >                  =
 =20
>>      /sys/bus/pci/drivers/uio_ivshmem/new_id
>>             then ./virtio-ivshmem-console /dev/uio0
>> then i start non root cell linux=20
>> (CONFIG_VIRTIO_CONSOLE=3Dy/CONFIG_VIRTTIO_IVSHMEM=3Dy),but i can not use=
 it=20
>> like a serial console. The virtio-ivshmem-console print some status,and=
=20
>> then there has no input and output.
>>
>> this is the virtio-ivshmem-console output:
>> Starting virtio device
>> device_status: 0x0
>> device_status: 0x1
>> device_status: 0x3
>> device_features_sel: 1
>> device_features_sel: 0
>> driver_features_sel: 1
>> driver_features[1]: 0x13
>> driver_features_sel: 0
>> driver_features[0]: 0x1
>> device_status: 0xb
>> queue_sel: 0
>> queue size: 8
>> queue driver vector: 0
>> queue desc: 0x200
>> queue driver: 0x280
>> queue device: 0x2c0
>> queue enable: 1
>> queue_sel: 1
>> queue size: 8
>> queue driver vector: 0=20
>> queue desc: 0x400
>> queue driver: 0x480
>> queue device: 0x4c0
>> queue enable: 1
>> device_status: 0xf
>>
>> queue driver vector: 0 is different with demo, Where do I start=20
>> troubleshooting?
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/fcde5e93-afba-4903-8c71-76cf965f7c5an%40googlegroups.com.

------=_Part_13164_1040544435.1696752512874
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

i=E2=80=98m in linux 5.10 =EF=BC=8Cand in non root=C2=A0 cell=C2=A0 =C2=A0e=
cho "Your message" | tee /dev/kmsg<br />root cell=C2=A0 virtio-ivshmem-cons=
ole can see :=C2=A0=C2=A0[ =C2=A0761.955026] Your message<br /><div class=
=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82023=E5=B9=
=B410=E6=9C=888=E6=97=A5=E6=98=9F=E6=9C=9F=E6=97=A5 UTC+8 15:46:01&lt;z ws>=
 =E5=86=99=E9=81=93=EF=BC=9A<br/></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padd=
ing-left: 1ex;">non root cell start with console=3Dhvc0<br><br><div class=
=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82023=E5=B9=
=B410=E6=9C=888=E6=97=A5=E6=98=9F=E6=9C=9F=E6=97=A5 UTC+8 15:25:28&lt;z ws&=
gt; =E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padding-=
left:1ex">Hi=EF=BC=8Call<br><br>when i use virtio console, i ran into a pro=
blem.<br>in root cell : insmod uio_ivshmem.ko<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 echo &quot;110a 4106 110a 4106 ffc003 ffffff&quot; &gt;=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/sys/bus/pci/drivers/uio_ivshmem/new_id<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 then ./virtio-ivshmem-console /dev/uio0<br>then=
 i start non root cell linux (CONFIG_VIRTIO_CONSOLE=3Dy/CONFIG_VIRTTIO_IVSH=
MEM=3Dy),but i can not use it like a serial console. The virtio-ivshmem-con=
sole print some status,and then there has no input and output.<br><br>this =
is the virtio-ivshmem-console output:<br>Starting virtio device<br>device_s=
tatus: 0x0<br>device_status: 0x1<br>device_status: 0x3<br>device_features_s=
el: 1<br>device_features_sel: 0<br>driver_features_sel: 1<br>driver_feature=
s[1]: 0x13<br>driver_features_sel: 0<br>driver_features[0]: 0x1<br>device_s=
tatus: 0xb<br>queue_sel: 0<br>queue size: 8<br>queue driver vector: 0<br>qu=
eue desc: 0x200<br>queue driver: 0x280<br>queue device: 0x2c0<br>queue enab=
le: 1<br>queue_sel: 1<br>queue size: 8<br>queue driver vector: 0 <br>queue =
desc: 0x400<br>queue driver: 0x480<br>queue device: 0x4c0<br>queue enable: =
1<br>device_status: 0xf<br><br>queue driver vector: 0 is different with dem=
o, Where do I start troubleshooting?<br></blockquote></div></blockquote></d=
iv>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/fcde5e93-afba-4903-8c71-76cf965f7c5an%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/fcde5e93-afba-4903-8c71-76cf965f7c5an%40googlegroups.co=
m</a>.<br />

------=_Part_13164_1040544435.1696752512874--

------=_Part_13163_810778024.1696752512874--
