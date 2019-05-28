Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVGPWXTQKGQEU3E7MAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 188052CCB3
	for <lists+jailhouse-dev@lfdr.de>; Tue, 28 May 2019 18:54:45 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id q25sf657605lfo.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 28 May 2019 09:54:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559062484; cv=pass;
        d=google.com; s=arc-20160816;
        b=dOh9odmXz+7b8Al0RkEGIeWw9mgZOEY2g42yaT99sVH/Bs5RXBS0T37DbIsgQ5pNwa
         I/y9LvRmlLMk2UeOU5qBteTeZsFQMCcJ93PU3eh1cer/xojCk0Km/aXTgvLuPc73dx6X
         VyIzxfZpvxLJOHhZDWww1Pwh+drPHivGzbHVEQX4BrwyVeMeFNk7svSnVYe//UXDZ5GB
         qdBO4uLYPiUYPwVPY/OErn3mB3yFu2MH0KJpzut98Xtwvb2RPawip/ZJPfEHpyIXhEN+
         2qsBIIJ5DOoK4jPazmM5KpiyXOZD2MFFbyqI2fLdZey5otMiRmDLtjO73PFfB7AJCR3Z
         hs5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=ovaqm3kJW1ahYHaj6NCbnMG2mpN1emmakoRyblUxsLU=;
        b=tWJTD0q21tECPgPjeaMB64U8DGUkx47nmeV7Rsye651ppR9EnoI21tLY5Z7wc0ShSN
         nrivQqWkythINKLPUJPFWANzardRZTinvk8IYxk47ytotYlRnqhlEkU1KJA8/u0EqP3L
         XWIkxM6CJMmqoWKWxXZ+hExuzG2RYHWLyR1pqRlj0uEsEDUkMYiD/XNL1hCCZiHdnMo1
         niQxvkKofuiIN3JyZhvVZPVkodvlKnrmqg1bG6+/n9TBJB+qrRbPYwVUhALrBdXAie0B
         nA7BigRY37s2K0v1Ye5QIGDln5vHyY2hUlLYTBxqGa50hmfRScXhOpO1w4XdS02SImHD
         ElPw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ovaqm3kJW1ahYHaj6NCbnMG2mpN1emmakoRyblUxsLU=;
        b=FhNqn0sdwf9taIGCITXzHh5+EDSSvVO3E0mx2p1Ik+G1DVA+jQbeWbczy6oIFFCS2G
         cyRPZs881f2kXzSm73IJL7LRk1mOiyC3XNVcamfIRBy74hvZajXsZY74VPxJvAYZgIKk
         Dz3iKv+DXi76kC7wdlHNagaYPrjCqKkcrzCZZKiUUS8Zr6TyK1yXZ/+YzjL060Iv5JWJ
         huhxmofDvYTiWmNhM/MgIY5oz1bRdq1X5QduuQplECW9i8Ho7Rl8SksITxMNNCUDycZh
         Lz2zalORK4m7+MFiNUMrkc56MfaWXdgM8Qvz1I1HnwtcamtFDp9aCz4Z1KFEcL1s4Svu
         HjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ovaqm3kJW1ahYHaj6NCbnMG2mpN1emmakoRyblUxsLU=;
        b=lP313v4K+kGE0xwcaDXTGrLLonjcxfQ9f/b03S3TfRnsTJ2wCVl4rT7XrrTVdk1Ysu
         SZfVSI+KVkPPlI8g0hDugw+muPDYtVXPi4du3BPEFQydyyW1pa45YVrlEcX6VL/jWU3b
         xeB1H+QKKNHC3PpB4SbUljLOtmrppZ+fLGS5chnUbCEHe9VTWs/cOdX5aYGAxQ0Pms5Z
         9FozLKYIT+abG6uCs3fgwpKpviAuboYO1jHNs7u1len+WEzEMWENhWMrl48dFhdOjiae
         BjZeHUB6M1AEddQBB+pZGHse86iWXUWPPavz58mFbQaaHZPog4TyPsNsvKSDujFZuweS
         OMug==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWkz/OiOLVKDPsYg4b1frhM9WSKegeIaUDRlRGSGN4SL3gig7kz
	RMTMlUzggk0m3NMI826loiA=
X-Google-Smtp-Source: APXvYqwlxadfLLKPtc8WgHH5cUowXNJbmXpVFxrpD9UtBXiSf0XfBUzSPSh2wqtnU7bVo+t7DytqvQ==
X-Received: by 2002:a2e:80d5:: with SMTP id r21mr12867180ljg.43.1559062484536;
        Tue, 28 May 2019 09:54:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:2c19:: with SMTP id s25ls2226504ljs.6.gmail; Tue, 28 May
 2019 09:54:43 -0700 (PDT)
X-Received: by 2002:a2e:884e:: with SMTP id z14mr19731229ljj.19.1559062483906;
        Tue, 28 May 2019 09:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559062483; cv=none;
        d=google.com; s=arc-20160816;
        b=lvnd4vZ1psxJEhCjVyCVV+6YPE0PAYV5PCyu8gjzWl07JF9mFoqQg9WzaPBgX/dRw6
         jI96muVJ8tYbRDiBjZ/CVdoQHAb+BSaryJWHsmOFD951uWwHc3kGQueuv/pvdus7UMtR
         g2Abx9Hm9A/zOTbrdvNfxZLJpnkPzXVu2xHUe4k2JOGgq6FFPvrUAWxCe4nbWhonw53l
         cGEaC+XaP9sQT1E0FGHP+ge7DbBLfOWe7ydWNamlo/QITwJFPJLhp9Tq5of4+Ksl1lY/
         YXPWSIUjaWOZi9yssqU2EEVGwN55c1M2hJXEQp23UPQ8/hvYlHwkOO8Ac1D010hYbnDK
         qjAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=G1ZZEORiN3zlIP3/kZ7S5NCtF2jOzU/s5JeNQSUghSM=;
        b=JfODfJ0AFPpaFVdxVzhm4xwTriPV1LsBY0k7eVaT+KxSU16ChqjX6u2S8um0tP2edE
         BGjK2KJRuHVRVcTQjHMoM8EzC8t49fP988p7O6Rj9t0gMt8c+VU8ntwP+th5w9V361RT
         QI8lSQaAfv56YUtT/cv4S9W/4mVAa4LcoSafIwN8OvF2wfujqIrmrY1FWG2CipnqfcRi
         8fm2XAdXwyI7yQUX0Feo02fUsQQbkJ9Fu616tfC2zq2Qj7GOZK53w1XbeV2DKUFEIy1h
         onWDJSifDfkNkTwEqJhy50erzPNmVJ4mJckFRzC3ORfeuPYUZfdHP1LGhEh2XyBs9LTy
         dMdQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id f23si45876lfm.3.2019.05.28.09.54.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 09:54:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x4SGsgJE011545
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 May 2019 18:54:42 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x4SGsgDi010798;
	Tue, 28 May 2019 18:54:42 +0200
Subject: Re: Ivshmem-demo interrupt
To: jeanne.romefort@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <e0e9eaef-1cff-4d61-a820-e007271ff7b2@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5c3a0b70-c047-274b-a78d-3e0d8a4a02a6@siemens.com>
Date: Tue, 28 May 2019 18:54:41 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <e0e9eaef-1cff-4d61-a820-e007271ff7b2@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 28.05.19 15:22, jeanne.romefort@gmail.com wrote:
> Hello everyone,=20
>=20
> I'm trying to run the ivshmem-demo on a lanner NCA-510A. The inmate cell =
seems to be working well. However, I can't get the interruptions between th=
e cells to work. Is this due to a configuration problem? (You will find att=
ached my configuration files)
> I explain : when I launch the inmate the shared memory is written but the=
 inmate doesn't react to the uio_send and there is nothing to read in the u=
io_read...
>=20
> here is my :
> grep ivshmem /proc/interrupts
>  202:          0          0          0          0          0          0  =
        0          0          0          0          0          0          0=
          0          0          0          0          0          0         =
 0          0          0          0  IR-PCI-MSI 229376-edge      uio_ivshme=
m
>=20

A typical issue is when there are two DMAR units, and the system sees the
ivshmem device behind a different one than it is configured. But your syste=
m
only has one unit.

The next thing to check is where the MMIO resource of the ivshmem device en=
ds up
(lspci -v) compared to what region you map directly into the guest. That MM=
IO
resource must not be mapped, it needs to be interceptable by Jailhouse.

And then comes printk debugging: instrument the doorbell register handling =
down
to where the interrupt is sent out as IPI to see where the transmission bai=
ls out.

>=20
> Second question: the next step of my project will be to run the uio_ivshm=
em driver between two linux cells. Is it possible or is the driver only for=
 the rootCell?=20
>=20

There is no limitation to root cells.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5c3a0b70-c047-274b-a78d-3e0d8a4a02a6%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
