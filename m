Return-Path: <jailhouse-dev+bncBCL6VUP7RYARB44J2LTAKGQETCQAL4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x338.google.com (mail-ot1-x338.google.com [IPv6:2607:f8b0:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9C919313
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 May 2019 21:52:21 +0200 (CEST)
Received: by mail-ot1-x338.google.com with SMTP id d11sf1659195otp.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 May 2019 12:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PrV1JjZRe6EY/Yy25b+eIwMqL9Qr0W5m5zzf+I7yHtQ=;
        b=YxhuFho7ff+W1k7Q8C36934R6ZR1GWbcfy7224890XU0dMZDgxXednFY1MSo1ze9Do
         vq8+R1w65eK2T/B0SxepfpkC265duJQTJ67nAOy7ni84rujUDsfAGuRV1iv3jCIyQ+RL
         9jV0JmiEBNqzMLhlf7Yr8LQbFz+XXxZtiIqLHC5fWMlu+DR7IORXEYOjsQuC2WzLzmb7
         PusvE4vlcOvLJnx6f9DgrUxVpz7J4PLX2Ocl9azy0+7cFydpuihffJ+E8dbC/ddDA+zG
         NRnuxd2UMdFplmb4v16eg7rDfURJSWZChogRfQHihK1/dvvDzvogdjWbaPt8NnWZO0Mn
         uthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=PrV1JjZRe6EY/Yy25b+eIwMqL9Qr0W5m5zzf+I7yHtQ=;
        b=a4qTGRECnvSkErjDEfMtAlQPaTANru7zZAGVIzZcM4fyMYqGqEnMxZRY8ur3XQh2pg
         1OowqtwTol5+U04lGLRUxebHEe3yXOUMAgL9Qih+rXqOplTv4DzYCbNgFGf8qz2B9sy6
         RcPnPuGlhSv8Hlx1ElrqmR7Xvu1CBXk7LJg9H7qC6FfgtYiyXTGklgFxEF2RXnuUYpCn
         MR1A4Rn7frMiiqygqH4UM+vJWmGbS28RUS0Q3NRBZ6cRwW/DRmdjkp3vzvp6Jn70+Gm5
         IG/bDTmN9U/tEhhOZ/Oc3MmXleA9xAKqhw6Z3F7WVtfoUJikC9xZzwvOmRNe+2GtHQLt
         eXAQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVFkxgPuFQTK1+NTl82aEXFSxCOwSh6uZlvjovImBYgOpD0tuM9
	2eLdGOaDcn4oXBhoD6GvrmM=
X-Google-Smtp-Source: APXvYqwxoYuAv8hOvzk9BSANW5JXD4xPgOp/peRfRrsAHpqefLT8CIGrgoCAi2KnFpVSZn+x988ORw==
X-Received: by 2002:aca:5f0b:: with SMTP id t11mr2555328oib.14.1557431539837;
        Thu, 09 May 2019 12:52:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:748b:: with SMTP id t11ls700523otk.7.gmail; Thu, 09 May
 2019 12:52:19 -0700 (PDT)
X-Received: by 2002:a9d:30d6:: with SMTP id r22mr3846607otg.33.1557431539245;
        Thu, 09 May 2019 12:52:19 -0700 (PDT)
Date: Thu, 9 May 2019 12:52:18 -0700 (PDT)
From: =?UTF-8?Q?Hakk=C4=B1_Kurumahmut?= <hkurumahmut84@hotmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c0798a91-b54e-4817-bb1a-9f97ba7ceeea@googlegroups.com>
In-Reply-To: <B9572A15-BD81-4DAE-9052-931E11167750@softube.com>
References: <B9572A15-BD81-4DAE-9052-931E11167750@softube.com>
Subject: Re: Building on Orange Pi part 2
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_335_443106096.1557431538649"
X-Original-Sender: hkurumahmut84@hotmail.com
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

------=_Part_335_443106096.1557431538649
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

9 May=C4=B1s 2019 Per=C5=9Fembe 22:06:20 UTC+3 tarihinde Arvid Ros=C3=A9n y=
azd=C4=B1:
> Hi again,
>=20
> I finally set up a computer to cross-compile both Jailhouse and a stock k=
ernel for my 256Mb Orange PI board. For reference, the Armbian kernel that =
comes with the standard Orange Pi images, are all compiled with thumb2 enco=
ding of the instructions, which isn't compatible with the assembly files in=
 the jailhouse repo.
>=20
> I have tried both kernel versions 5.1 and 4.19, both with the same result=
s. The kernel compiles fine, and a chose to copy the kernel config from the=
 jailhouse-image repo for the Orange Pi board. This yields a kernel with mi=
nimal features but no undefined references when compiling the jailhouse sou=
rces. Jailhouse.ko loads fine too.
>=20
> However, before calling jailhouse enable, I need to reserve memory for th=
e hypervisor. In the jailhouse-images repo, this is done by passing the ker=
nel arguments mem=3D128M and vmalloc=3D512M. If I do the same, my kernel ne=
ver makes it past "Loading Kernel image ..."
> If I change the arguments to mem=3D192M, it works, but then everything ha=
ngs if I try to call "jailhouse enable"
>=20
> Can anyone recommend how to proceed here? Do I need to change anything el=
se regarding the kernel or some u-boot thing for mem=3D128M to work? Or, co=
uld I go with mem=3D192M and modify the cell config somehow?
>=20
> Best Regards,
> Arvid

Hi,

In such cases, Jailhouse hypervisor console information is more important t=
o see root cause of the problem. If you do not get the console information,=
 you cannot get much help.=20

Open Hypervisor console on new terminal may be ssh connection more suitable=
 against Linux hang situations.=20
 =20
--sudo jailhouse console -f=20

If you have uart port, it is pretty. In FAQ.md file,=20

on real hardware, you'll need a serial cable. Connect it to the COM port on=
 your motherboard. Many modern motherboards come with no COM ports, but the=
y usually have a header you can attach the socket to. Servers often have se=
rial console available through IPMI.=20

In hypervisor-configuration.md file,=20

#define CONFIG_CRASH_CELL_ON_PANIC 1=20

it is suitable for hang status. please add it to "cell-config.h". And rebui=
ld and reinstall jailhouse.=20

Good luck.

HAKKI

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c0798a91-b54e-4817-bb1a-9f97ba7ceeea%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_335_443106096.1557431538649--
