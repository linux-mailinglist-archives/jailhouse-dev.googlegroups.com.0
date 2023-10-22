Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB77R2WUQMGQEUHHDYLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 630267D2599
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Oct 2023 21:33:21 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id 2adb3069b0e04-507b9078aaasf2686291e87.2
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Oct 2023 12:33:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1698003200; cv=pass;
        d=google.com; s=arc-20160816;
        b=UwsKp4pBp8Pmx7XI//HfWkW/6yqNQvK53Au+Q5hDiBZ50ETYwDgp9fl2UEJrotUmTg
         voBPQFTRf5z2RNQYArSlCPwMwnuJWpqlRg0zCcvFn+QxU30nzfOi1R29nNOSWZhz//Kd
         JWp3oQ1WJSDTNaUAGHRhs2DS2ZEBC10Km37JEgDk+hBnYYm4cWwClTW5ss1BGN0sPu5k
         3BfxwAtcbxy9zym69iXKEwEmE0ZuykHfFdopOAc9r6AwHYdR2L6jk3HYOO/k+UZqeiqh
         Wd0V9tYS4vhcKh+3Orzo6P71Hv7iqDE6BPc5G548lTwkVo1YZM6NN5DJpOO3p0jgJCd/
         sbBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=2p2aGQwTEuwYMBZyMOMha5qbxxsFxtFGuIF60KCflBw=;
        fh=akHdv3Wk7GB2ZBSX0SiiwrXjfJGPV96R9Tt8zBnfqRc=;
        b=XJcor8jAqn8I9aTxT1OhTEDffu7K5+/yvDrRc8yUCcGPLtxtdhTueuQLcX3oAJOMUi
         e0DyeHchQVAWl4sT/FA5LDtFXpmHKxTvFJau7aVY9sVLd9xqWnMDIpi4kqcnAMcop/hs
         0FT9JWc+yM1GDzBYFOA9lUclhYAdazQgrrrLwRm7iDpMcl5gTTj4FXCl9KieLYuEEYv7
         d7LzltBGfukjbG0U+YhEei0SC3VqCg/7XE1gTA+9d3yunkq4gqAbGD5ZbfYnKe+IMuLj
         ZLN6pbVkl6NHlE7nyEZxp6fjYLGC/ifQzeV499fTMJgIGncKAMc5CRNxPJC08cMR+/Ls
         AhhA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=FVFIC3sx;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.235.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1698003200; x=1698608000; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2p2aGQwTEuwYMBZyMOMha5qbxxsFxtFGuIF60KCflBw=;
        b=QaEp0LCGHuuXuDA8KhOpIhR4WuwPXJSfRNzKw4CqgeE/5VHvp3DWiZqkXpZfDNkjV8
         vMWBzyVSqzI2zUv2MVhL/jh2RDoC2ICwRmp4Tw/x9bo6ODFaPtE6H2CLT87h+bcyYB3I
         6f8Q3hORZXmYDGNEkmJo7OnlgiYIbUv3/K9jgOSBnOeioWln/o0zRrNpaVw/mVURl/1u
         V4sXHlNQoIerC4/x6wccAq0t91Rj3lQxEOYZXWvSYodbBAi9kASgC5qOB72aoe1oJDZG
         GTwthCcvuEGCm8X8Ri+If6sk24QaIvEkxz+5Xcb+gIfrCs73Zuh9AMqKxUeo+5Y8WjKI
         kaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698003200; x=1698608000;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2p2aGQwTEuwYMBZyMOMha5qbxxsFxtFGuIF60KCflBw=;
        b=sSz1BGDilZ7EgseyoxxFE1PTuFVAUgQDG4TYtgVEfPV61N/8mDDnXAuYg2oHsfRY+a
         mAvlcIV/4kJRW+x9JdIfij6OsvsbN1FbijXjL4SrWiWd6IPNt5vEJ6JnajES+ffMmZN/
         pHMAlEQk0K452ajJOaLQes7Y+57Y46A+N7qKTVu4gHitnOFLvLzvT6ewHvQM3bkZfDnh
         pYTwe/gWokjh16PrIHhB8Dct1O5PwBLR1x1TkXTJ5bED8vqA92ZSYIEdpgePbotWWc71
         Rappfji5dpNYxbT1swqc/3b9zpYhfBtF/BOlFSlNhWXcbPehG/Y6J6Ph8HYBbxXAjN1q
         aLYQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yw952GFjNX5jibgrCDXd/vW1eoOLGxbqFLRdg+/LHmKH3/dIQ8u
	nqLDDppAYNvlChij4HFlX9g=
X-Google-Smtp-Source: AGHT+IGSLWtd5W7RM9T2bKJ8E+KRSwfAI0Z1ridXmy27US53ICrE3+KdXPRWuY+2yLugqHHrfFIsNA==
X-Received: by 2002:ac2:42c2:0:b0:507:b7db:1deb with SMTP id n2-20020ac242c2000000b00507b7db1debmr4090259lfl.38.1698003199998;
        Sun, 22 Oct 2023 12:33:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5462:0:b0:4f9:5599:26a with SMTP id e2-20020ac25462000000b004f95599026als1396225lfn.2.-pod-prod-08-eu;
 Sun, 22 Oct 2023 12:33:13 -0700 (PDT)
X-Received: by 2002:a05:6512:214d:b0:507:99fe:3237 with SMTP id s13-20020a056512214d00b0050799fe3237mr4458448lfr.41.1698003193213;
        Sun, 22 Oct 2023 12:33:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698003193; cv=none;
        d=google.com; s=arc-20160816;
        b=kMyGaBBAaZX5iuEvEI72IJZ/uHRRxcaYfGVyQT5VYt7/KZasuVfa2UVnAc6yhnBwbw
         9yBnPFK7JAuhEQJ9abi/SI5KNqZDWU4x7kk9LOWj9BFFjqLTTLqVRX8XH0iVWzmd5tD+
         5yAl+vK4O9f4bQwx+8fzLJ3cmNeab2USelK7GxYzGpeYFkrZmTLw7lt9wGu+mt1IGOFF
         a7XlqPHMvPTGG6GVTD/eyivFVPwGxIlsKNB9W8hlNdcTosvQL3b/RAk/Zug5A1OFCfNq
         caMVEIvSUfKEdQDDS2m7kHOVwr0p1KU26mNM16sHF+7bG3p4Di/Cxnpi731f94xlRS5x
         mCwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kC9EUIvDb+OlBQ0oipAxJWTrLMb8yzHNb1GLDmTiugs=;
        fh=akHdv3Wk7GB2ZBSX0SiiwrXjfJGPV96R9Tt8zBnfqRc=;
        b=VlPVSTcgvi1QFBo4/YZyK2bza1Iu1pFDPE7UKWK78EZA7VoDapRZxcxWJG3JjA1rmJ
         eKujxHHFfGmDZrcVXuMvJ88Y4LSqcDnYnI57rQmAXKuEuYRzeXfjjNY9kz2RJqzVa1D/
         T2odZj0KCNfDLjfbcNFB7nBNn86iLHCXc4AsAogM6LPSa+B779wKsa4frE/3x0cHsuFW
         Ou+3oRidYGM7M7b4gEmHD29+pRVHlnSZeZqmU+quRs/r2t4WToPU1B7cnwyxEs5f3fku
         rc5GwKhlCaebDxuVBEJYJHYwGAzsGvGBogfVHq7ReDFxUoDk2UfNC8VFJ4YcA76vcmky
         MQbg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=FVFIC3sx;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.235.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from b2752.mx.srv.dfn.de (b2752.mx.srv.dfn.de. [194.95.235.60])
        by gmr-mx.google.com with ESMTPS id bi5-20020a0565120e8500b0050446001e0bsi195223lfb.3.2023.10.22.12.33.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 12:33:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.235.60 as permitted sender) client-ip=194.95.235.60;
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de [IPv6:2001:638:a01:1096::12])
	by b2752.mx.srv.dfn.de (Postfix) with ESMTPS id 7F9D83E00D4;
	Sun, 22 Oct 2023 21:33:11 +0200 (CEST)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4SD7lW137YzxsR;
	Sun, 22 Oct 2023 21:33:11 +0200 (CEST)
Received: from [172.23.3.112] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sun, 22 Oct
 2023 21:33:10 +0200
Message-ID: <f882f247-b4b7-44f3-a820-235c30453d7c@oth-regensburg.de>
Date: Sun, 22 Oct 2023 21:33:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CPU shows offline - Jailhouse Linux inmate
Content-Language: en-US
To: Bharathiraja Nallathambi <barathiraja@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <CAGA=GbzmH9eiuBrKjVeeKf--5fRFVGxwyCe6D20e4MDn66d3tw@mail.gmail.com>
 <3acdd865-1303-4ba1-8c4c-9fc3ca8d2c67@oth-regensburg.de>
 <4cf5731e-a3ff-47ca-a1d7-c4f11a9e096bn@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <4cf5731e-a3ff-47ca-a1d7-c4f11a9e096bn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=FVFIC3sx;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.235.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi Bharathiraja,

On 20/10/2023 15:50, Bharathiraja Nallathambi wrote:
> Hi Ralf,
>=20
> Thanks for providing the suggestion, with the boot log, we found the=20
> below message,
>=20
> /[ =C2=A0 =C2=A00.045828] psci: no cpu_on method, not booting CPU1/

Hmm.

>=20
> We went on updating the inmate Linux dts with the following node,
>=20
> /psci {
> compatible =3D "arm,psci-1.0";
> method =3D "smc";
> };/

The device trees are in jailhouse upstream, right? Actually,
'enable-method =3D "psci";' in the cpu section of the dt was sufficient so=
=20
far. Maybe this changed to cpu-on? It might be that your change is=20
required for more recent kernel versions.

If so, patches welcome! :-)

Thanks,
   Ralf


>=20
> Now we are able to see both the CPUs enabled and working as expected
>=20
> /[ =C2=A0 =C2=A00.003483] CPU1: Booted secondary processor 0x0000000003 [=
0x410fd083]/
>=20
> Thanks for the support.
>=20
> Thanks and Regards,
> Bharathiraja Nallathambi
>=20
> On Wednesday, 11 October 2023 at 01:26:19 UTC+5:30 Ralf Ramsauer wrote:
>=20
>=20
>=20
>     On 10/10/2023 17:17, Bharathiraja Nallathambi wrote:
>      > Hi,
>      >
>      > I was trying jailhouse with a linux inmate on an imx8mp-evk board.=
 I
>      > have created a yocto build with jailhouse and linux kernel
>     6.1.22-rt8
>      > which is having the patches for real time linux.
>      > Booted the board with running run '/jh_mmcboot/' in the uboot
>     prompt.
>      >
>      > =C2=A0Once logged into the device, I have started the jailhouse by=
=20
>     running,
>      >
>      > /cd /usr/share/jailhouse/scripts && ./init_jailhouse_env.sh && cp
>      > /run/media/boot-mmcblk1p1/Image
>     /usr/share/jailhouse/inmates/kernel/ &&
>      > ../tools/jailhouse enable ../cells/imx8mp.cell; jailhouse cell
>     list;/
>      >
>      > =C2=A0the above command will load the jailhouse.ko and will enable=
 the
>     jailhouse
>      >
>      > I got the output of 'jailhouse cell list' as,
>      > /root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# jailhouse
>     cell list
>      > ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Name=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 State=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Assigned
>      > CPUs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 F=
ailed CPUs
>      > 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 imx8mp=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 running=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0-3 /
>      >
>      > =C2=A0Then I started the linux inmate, the CPU offset in the cell
>      > configuration is 0xc which will assign two cores. I am using the
>     same
>      > host kernal image for the inmate also (6.1.22-rt8). Used the below
>      > command to start the inmate
>      >
>      > ../tools/jailhouse cell linux ../cells/imx8mp-linux-demo.cell
>      > ../inmates/kernel/Image -d ../inmates/dtb/inmate-imx8mp-evk.dtb -c
>      > "clk_ignore_unused console=3Dttymxc3,115200
>      > earlycon=3Dec_imx6q,0x30890000,115200 root=3D/dev/mmcblk2p2 rootwa=
it
>     rw";
>      > jailhouse cell list;
>      >
>      > =C2=A0I got the output of 'jailhouse cell list' as,
>      >
>      > /root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# jailhouse
>     cell list
>      > ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Name=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 State=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Assigned
>      > CPUs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 F=
ailed CPUs
>      > 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 imx8mp=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 running=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0-1
>      > 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 linux-inmate-demo=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 running=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 2-3 /
>      >
>      > =C2=A0I could login to the inmate using serial console. But the ou=
tput of
>      > 'cat /proc/cpuinfo' is showing only one core.
>      >
>      > /root@imx8mp-lpddr4-evk:~# cat /proc/cpuinfo
>      > processor=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 0
>      > BogoMIPS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 16.66
>      > Features=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : fp asimd evts=
trm aes pmull sha1 sha2 crc32 cpuid
>      > CPU implementer : 0x41
>      > U architecture: 8
>      > CPU variant=C2=A0=C2=A0=C2=A0=C2=A0 : 0x0
>      > CPU part=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 0xd03
>      > CPU resion=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 4/
>      >
>      > the 'nproc --all' is giving 2
>      >
>      > =C2=A0It looks like 2 cores are assigned to the inmate but one of =
the
>     core
>      > is offline.
>      >
>      > /=C2=A0root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# cat
>      > /sys/devices/system/cpu/cpu0/online /
>      >
>      > /1
>      > root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# cat
>      > /sys/devices/system/cpu/cpu1/online
>      > 0/
>      >
>      > =C2=A0Am I doing something wrong? How can I turn on both the CPUS =
for the
>      > inmate.
>=20
>     What does the non-root Linux kernel console output during boot? Are
>     there any error messages that might give you a hint why bringing up
>     secondary CPUs failed?
>=20
>     Ralf
>=20
>      >
>      > Thanks and Regards,
>      > Bharathiraja Nallathambi
>      >
>      > --
>      > You received this message because you are subscribed to the Google
>      > Groups "Jailhouse" group.
>      > To unsubscribe from this group and stop receiving emails from it,
>     send
>      > an email to jailhouse-de...@googlegroups.com
>      > <mailto:jailhouse-de...@googlegroups.com>.
>      > To view this discussion on the web visit
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/CAGA%3DGbzmH9eiuBrKjV=
eeKf--5fRFVGxwyCe6D20e4MDn66d3tw%40mail.gmail.com <https://groups.google.co=
m/d/msgid/jailhouse-dev/CAGA%3DGbzmH9eiuBrKjVeeKf--5fRFVGxwyCe6D20e4MDn66d3=
tw%40mail.gmail.com> <https://groups.google.com/d/msgid/jailhouse-dev/CAGA%=
3DGbzmH9eiuBrKjVeeKf--5fRFVGxwyCe6D20e4MDn66d3tw%40mail.gmail.com?utm_mediu=
m=3Demail&utm_source=3Dfooter <https://groups.google.com/d/msgid/jailhouse-=
dev/CAGA%3DGbzmH9eiuBrKjVeeKf--5fRFVGxwyCe6D20e4MDn66d3tw%40mail.gmail.com?=
utm_medium=3Demail&utm_source=3Dfooter>>.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/4cf5731e-a3ff-47ca-a1d7-c=
4f11a9e096bn%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/4cf5731e-a3ff-47ca-a1d7-c4f11a9e096bn%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f882f247-b4b7-44f3-a820-235c30453d7c%40oth-regensburg.de.
