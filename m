Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBDEB22BQMGQEY5S2EOQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBF535DDB6
	for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Apr 2021 13:29:17 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id g21-20020a1c4e150000b0290125a227e5bbsf993868wmh.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Apr 2021 04:29:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618313356; cv=pass;
        d=google.com; s=arc-20160816;
        b=X4eCwc4/VmGlGzLyXdDJ6llVHp8Vob7IdPatun7pldFDXujn/L1gOmzTr9KFdj2srl
         eVpMyFk+vzDOVbTuux0L651dkoYWZA+PVucHwtXBRLDxIudiKwzvgjaXESe91NqQsiAN
         dZhoIjE4ONHcjJcy2pYKu8ijEzMpDVG+v2SUwHEfmHxIaKggNxlG/WpC7nEFSKb9bX7W
         5H0iVVnViZmMt7JzCPIgVWvdbD805g3qhJtL8le5+uvv9gLNbOZdxcJUjyWxWYLiNOlj
         TWThJ+6GTRz2Ug1QYCQ9/zZ0lbm6Rbo2GpMXbSoPhry+XTwnWTQ6gJ1kqkht9KuU+XLL
         PizA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=+rAzZIPpNZHsWUT57fm1rSwaykrWDHJilJFPVPwNGNM=;
        b=X1bDbRFuXApun1q0LU1NKOTOlgRMVHZE+M8UpR4BhuHCnp6wlPKbMMPlE8FNNIw6kJ
         5md+t1kXR+5pbPSa4EP/2a/DG070w0DQjkdMMYIrtjDsld4QHD0NfSTOuZ3svE/w0NLx
         c5gMahHjmNalj1eLK6Qbg2UwzCtQTTQ+I1bhGnsEsXW+HKE7IcEKdM44qLbgNsKUkEKV
         jhmdhv1p9+1/7IhW39xtT9V4mEz4Qpjj7j83aOYKHMP2hEib1UefvQ0Gtwx8gGbFXx2u
         40dNzhETPJF3Uofg350Vh/phT9o56ekxSCDpQIg0jkCqVXIf6/y+I0pOB5VN8cNJ7vOk
         k6Ew==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=YIcBYwNY;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+rAzZIPpNZHsWUT57fm1rSwaykrWDHJilJFPVPwNGNM=;
        b=P6RQNBBePLGHO2wGSiyBKGxkIr5PiMsjTDOj9Qc2zJQBYue8lGY5tbA1q+Vvm+ZylX
         wpRULPPfcuQmYay7GjnQxpXxEbqPQidmRymLv45Fy9DCsk1Dp6nVzYKtM8kW5BUJ9MFL
         Wt3yB9HNUirPy+6cJYivWvfQSpB69NulIwVPMdg3B9wVwV+3+pgp1dLGXm4nj0pGSk9w
         AwSU2Qv+k7eFwef8WvzeJnnjnDWkYgZ86HCHepTURF01+PJ+APMijz5f2lPu8RSCUVTs
         7h0kJnjwd6xOcqhkd0B8ECnJNpjYpcCHf48QxZMOXcCZTaUOdeQ+ljQpftR83AUhktgF
         jd2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+rAzZIPpNZHsWUT57fm1rSwaykrWDHJilJFPVPwNGNM=;
        b=fFMPWu9pEeeBDJH6VQpe0zB1uJwLDxGK17JidV32CJ3E7Ly1iNpUi1bDrTg/ulZtjq
         4a5qvaqNOSc+TgRSXr8DOg8VMgFSN8RJXqoAKdMxQh1H2crbYGWIqu8+AcMY0f6Eqe1D
         K5mg1rXmqMC4NHGPOS30tOML8v/O7M50WpJENcLs2c5wr8ENTJ5taj6nDtt/v+TNYIj1
         jR9Zy4w9N81fdttYYwFMqo4gGuU48xFbKgRE54A9ni35aaOZLflBqubLpnPhjtS5/gnE
         sVNn6TjQdLX/WCktmy7kO+3ycuYw3tqgBxOipOBlbUTK3WULsJecmleex2jAekqE6A4I
         7rOA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530yDBy2kzLuR77lWNdyTaLy6pknhCVW4VlbXr8E09TADH/alDOQ
	qrlqzuIn5WhI8N0YI2Nen1s=
X-Google-Smtp-Source: ABdhPJy0EbwmLdgJm1dBnTkF3vIOiCYjpsa/nuz/u+Skjmgte+TZAqfiGnTYuIeqcLvJwiAblZIylQ==
X-Received: by 2002:adf:f44b:: with SMTP id f11mr37144626wrp.345.1618313356791;
        Tue, 13 Apr 2021 04:29:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c1c3:: with SMTP id a3ls1206298wmj.0.gmail; Tue, 13 Apr
 2021 04:29:15 -0700 (PDT)
X-Received: by 2002:a7b:c948:: with SMTP id i8mr932209wml.107.1618313355775;
        Tue, 13 Apr 2021 04:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618313355; cv=none;
        d=google.com; s=arc-20160816;
        b=Fz8gTfzRuCTmgTygJcu/X/O7f1Qy7w4hSJmvJfEDrTJTnhkVXYzBe/7/S04QUsRJgT
         Og4Gz8JIt2dqxoA5CQjT8sT9z/9qKziE/oJyztzlfRTo2wjFG1OugAVlR9TamUmwBsIg
         kZvQXqxNIOSV3B0MrYZDD8nuscu3FeQodbGnMht1uyUqPgHA1VtpnNcwdZHCagjF/XTk
         gIfq9Img7d/Xg0GVuSd5crugw+1YBlikl2+cHD2qDSq4NTf4RNtMrP09/9onWCyUNwPu
         Eh3kIa42j1zs0rim4+Z77q2BcQyNAJq7J/n5Z3UTpQvHb4fgESG8wppBy4i0OyLiNk7f
         ch7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=8KMVjbGi5fRpFMs0W6eh9uLhF1m2sJFoLBwHd64/6Nw=;
        b=ylNdB63PjAP74+ZHvbCuIeiA/3r82JlGMyRhLjzT70jQUALPhpCuDocAq9GmcNj6Ts
         mGS7CZKAhnY2rodBlFOdtcZXXNEYUSYI94+WmPnH3m0L/5NcQ/synMKxH7lS+eFJerSj
         jrmYiAAHTGQRoj+dlwviY8V+8bw67tW4Vu0KD1BLCLv/XJBH2P1zG1W4MmVRYTkzKgZ/
         pRYMrgGxwIohlv9aId8REDj+fqe4b3STHU100yKV6A34BqFyeiNV2NP5R9hzezh0F15V
         U1XcuignG0RhDTyZbPOGSgBrYbtd50vILw3uiM5C5hRFTQ/bvBYhQVB8lkNHs+JZ2Xv1
         6vRw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=YIcBYwNY;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id a4si1123183wrc.0.2021.04.13.04.29.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Apr 2021 04:29:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4FKNfg2rSSzy1c;
	Tue, 13 Apr 2021 13:29:15 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:5c51:6883:5436:5db]
 (2001:638:a01:8013::138) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 13 Apr
 2021 13:29:15 +0200
Subject: Re: How to build jailhouse in Raspberry Pi 4b
To: =?UTF-8?B?5pyx6Iul5Yeh?= <zhuzhuzhuzai@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <96f74988-49c2-45b7-be31-67bf46c75cedn@googlegroups.com>
 <680669ce-69bb-1403-1c2f-8ccaa317baa9@web.de>
 <447e0050-c0a1-48b2-8390-2dcfba0fca5dn@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <a33be9b1-5704-26ad-9a75-e7523600d8ab@oth-regensburg.de>
Date: Tue, 13 Apr 2021 13:29:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <447e0050-c0a1-48b2-8390-2dcfba0fca5dn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=YIcBYwNY;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi =E6=9C=B1=E8=8B=A5=E5=87=A1,

On 13/04/2021 09:18, =E6=9C=B1=E8=8B=A5=E5=87=A1 wrote:
>=20
> Hello!
> I success build it now with linux jailhouse-enabling-5.4-rpi kernel. But
> I can't enable the jailhouse . dmesg tells I didn't reserve
> mem_regions,=C2=A0 while I did use mem=3D768M in cmdline .

I never used jailhouse in RPi, but as far as i can see, the reservation
comes via device tree and not via cmdline [1, 2].

  Ralf

[1] https://github.com/siemens/jailhouse/blob/master/configs/arm64
/rpi4.c#L14
[2]
https://github.com/siemens/jailhouse-images/blob/master/recipes-bsp/rpi-fir=
mware/files/debian/jailhouse.dts#L15

>=20
> =E5=9C=A82021=E5=B9=B44=E6=9C=8812=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 UT=
C+8 =E4=B8=8B=E5=8D=889:25:54<Jan Kiszka> =E5=86=99=E9=81=93=EF=BC=9A
>=20
>     On 11.04.21 05:20, =E6=9C=B1=E8=8B=A5=E5=87=A1 wrote:
>     > I just want to build jailhouse in my=C2=A0Raspberry Pi 4b which is
>     supported
>     > arm64. If jailhouse is support Raspberry Pi 4b arm board now? If
>     there
>     > is any page for how to build it in Raspberry Pi? Can some one help
>     me ?
>     > Thanks very much!
>     >
>=20
>     You mean use 32-bit ARM on the RPi4 with Jailhouse. Might work with t=
he
>     existing configurations as well, never tried. But what would that be
>     good for? 32-bit is slowly fading out, arm64 is standard on hardware
>     that supports it (downstream raspi does 32-bit only for legacy reason=
s,
>     some images for old hardware).
>=20
>     Jan
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/447e0050-c0a1-48b2-8390-2=
dcfba0fca5dn%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/447e0050-c0a1-48b2-8390-=
2dcfba0fca5dn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a33be9b1-5704-26ad-9a75-e7523600d8ab%40oth-regensburg.de.
