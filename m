Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBO7R4TTQKGQEFLOX5PY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 305CE37908
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Jun 2019 18:01:00 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id u11sf1176555wri.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jun 2019 09:01:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559836860; cv=pass;
        d=google.com; s=arc-20160816;
        b=DlNQ22Zxrlz/dC5uFQzMEMOe5T+rUMkR8mh81Qbnn6OnIfUg/LA6n5xgmk3ORM4uDz
         30KRks/zVuv5b1VETAXTmMMh10F775Tmpt958Yu4enkl4Dozgw7mzHk05QZAI+cDQ9uA
         vtzYm08Au3aTm598Bg/8wL7NeydduRvj0B9IXMOvu411KKiEehKfBECT7hbS547ZXu+j
         Of7u2cgc+hjz3NQWX2iGiVUnNVl7KlhpUTBAjX57tT869oKS+oD5l1nHYCM0yRXJg7tl
         ns8i1geM4Ek8rfuNF6QooFJF1/iNhi5e8+UnBO9Lp0LDu1uK9EuMVkYxmJ3/v/GQkknW
         DCBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=ToEPkLoID5/InV2WTyJt0RAp4RQORuePArDRZAT3pOA=;
        b=qKptfxvoQV6At4d3idTyTjfHlJMOw/7yg6bvsXblZ8+3u9TZwGvRB1TCELYqqL0VEj
         aPEIMrD3+4+6u6ZuYYJDqH4JUFtUzij2snP/BuzEzYg3RPvIyX/yBMEqNJ86RzFSbbSM
         s5vz96BvLySduRcDWtaCHFWBKvSRT9ZcShu56TMAPEyF2KysJ7bV1Tnit3fqj4sXGidT
         /eOwOnWZgTeMwzKnrudmwDFgVxkD9kPs+uz2rSVAX2EHJXVsPrB7Y+42Sw9E4zu9QuuO
         NJGYES7t3gd4yQ/OICKzDKqJw6wnoWDir4SbxRrnUjC/h/N2thaieNziURsag7bFkpJW
         XJ2w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ToEPkLoID5/InV2WTyJt0RAp4RQORuePArDRZAT3pOA=;
        b=Fay14gNbNjO/1AwERX+ZjYXsNP0ehWVFPLc+Ih3IuaaEaUI+LBoaRaoJ/3ea3jS4yw
         HAjpsJI9myAQmvNCv7fvHcth2owK1CkuclGOlfLE9vGFfm1hkecHFzNXznW0ZrdTKLDD
         5oPaJNAMUuyD6ce/GQy1bSyKwYJsfYUf0OU2g6HQbmljLNfsORBMnZYewwHeaoLUESdw
         WeeVBwKRYtJKvKGL6ViM8XDkctdvXfepeqJAgp2D6A+owSTe5S4ws07vXaFd78QO8Ve5
         ITUs8sFKKVboPL/wYgRj2y31fx06poWoxTL3mG33Lr2vLYwddYqhxfaYgtNa89g5lRUO
         cxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ToEPkLoID5/InV2WTyJt0RAp4RQORuePArDRZAT3pOA=;
        b=uY1bXlendePh54OLjjizwd4Bf7JKZs961X2jvKBy/wMtbSXlTcyZc5+16GGRJRJTfT
         4sfUPyCr7TJ3joualEmJQAjoIukjEpKWbGK/IMEmr/Y3lBYBbn8ap6dKiolqyzOmkepM
         Gr+GGS2j6ao/d9PLaAnC0wpR7f71oFxgv/qOpBeRobJJnuOc5t1r5g4op4JYvpRYxRa0
         DA9MmM9OFGr4gAgZ70kMA9GQ8Vh2RwhIMFwhAPhPy0MDk6I3axumcx8pyo0FNjWHwkMX
         uuUFQIlrWE8jK6MkYaCuYgfedRkOcPGlslL/RLC0s+ElzGCExgw6LsnhqIYeJVvJFlNQ
         Jw7Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWf+HKU1alVlnyoqbmadVXHH2135dIJYtBI6kPagA/iMrDpeSa1
	QRc8YH8bXKv7DIeV4bOu7qs=
X-Google-Smtp-Source: APXvYqyv1YQ4o6KS9Gn0mdceBR1CGYlG10ep0iSmIWSoA+txgDcfjunCzldNC2yJg2dCfz9hgbSZXg==
X-Received: by 2002:a5d:6acc:: with SMTP id u12mr21504330wrw.349.1559836859965;
        Thu, 06 Jun 2019 09:00:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:b484:: with SMTP id d126ls1886493wmf.2.canary-gmail;
 Thu, 06 Jun 2019 09:00:59 -0700 (PDT)
X-Received: by 2002:a1c:a002:: with SMTP id j2mr498279wme.131.1559836859190;
        Thu, 06 Jun 2019 09:00:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559836859; cv=none;
        d=google.com; s=arc-20160816;
        b=MLeftg3APFbuktXi/JQRE3bQJtp29nGnL9tFCDlEy6pPQPqeLu6+uXdqPo2uj0Oi35
         G421ZgB28Cm2SDzKIS5JBlktPEadD1rGkLbzHPwd1MhPoVi75Kga5APrXL7BuDiPqzWl
         VbpOpGJZNJZ1rwQk5uTkxwY5PSUsD7vDK98TYRybrAya/OWDgSpbp9b6ZpSOISTAgmx2
         xP5B1tfnhxn/vQTxrSD7K2IReCPwa9nkiDNpbv1peKzMKd35FirDPhM8ucK8RD2Mmhq6
         NnSwap0Ux9HUY/8pkLOMvcOlRwdP3YSvhhDwfS3MXG0hTDxdA73lx7726A3ALcmarW3Q
         a5RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=5rKmO3vFl+QCk53Yfneo5EKpbY1S461BLqMz7mrPtPA=;
        b=pjgYHdRj6clqlRuwhBkRrMh/tBdLuRWllC1FBVY+EEcDSKCRC22ka+wqDARMOhwue4
         2C71hjwhKgyRYyfPJD2rLsfZw1cvbT1AvnIT+bX7ewzmJeGbJ/OthUNeM/mUAwSukHRk
         Y5jLBRcvc3BfqnphFkixiE+P7PQITckxfubRoY9liDugAP0ICFQIRsX7BFuSovzG6vST
         w6c29E/l8WNI/xVVTqKN7x5JA4cZa6oocji1rjc7jk5p1PYBlPcmBh/EH1hx2F41ta8L
         LeSv7zlbAZ5QEIKBclzPejHuOr1a2y1N7Xuvu+5xFYpb0GW/mGBfIBB0CkP9MCrQaYp4
         JI3A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id h13si33376wrt.4.2019.06.06.09.00.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 09:00:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x56G0wTj002667
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Jun 2019 18:00:58 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x56G0w5L026178;
	Thu, 6 Jun 2019 18:00:58 +0200
Subject: Re: Freertos-demo bare-metal boot
To: Johannes Maisch <johannesmaisch95@gmail.com>,
        "Dr. Johann Pfefferl" <johann.pfefferl@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>,
        Daniel Schmid <dascit16@hs-esslingen.de>
References: <f8c8bb48-ac7a-4bd2-a554-0f42a31fa5b6@googlegroups.com>
 <90eb1048-d5b5-7dcd-fa9c-ff9b715bd97b@siemens.com>
 <20190604102704.7xy42j25eq2h67rq@jpc.jpnet>
 <9d12161b-a004-ad5e-0dfe-1b1c249358cb@gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <cfab21e5-f8ea-15b1-981a-82592abe25c9@siemens.com>
Date: Thu, 6 Jun 2019 18:00:58 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <9d12161b-a004-ad5e-0dfe-1b1c249358cb@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 06.06.19 17:52, Johannes Maisch wrote:
> Hello,
> thanks for your assistance. However, we can't boot freertos at the moment=
. I=20
> adapted the linker script like this and rebuilt the freertos-demo:
>=20
> ENTRY(vectors)
>=20
> SECTIONS {
>  =C2=A0=C2=A0=C2=A0 /* jailhouse arm inmates have to start at address zer=
o */
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D 0x48000000;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .boot=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : { *(.boot) }
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(4096);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D . + 0x1000;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stack_top =3D .;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D . + 0x1000;
>  =C2=A0=C2=A0=C2=A0 irq_stack_top =3D .;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bss_start =3D .;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .bss=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 *(.bss)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 *(COMMON)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> after that i tried to boot freertos in u-boot with the following commands=
:
>=20
> =3D> load mmc 0:1 0x48000000 freertos-demo.bin
> reading freertos-demo.bin
> 198508 bytes read in 45 ms (4.2 MiB/s)
> =3D> go 0x48000000
>=20
> But the Freertos-demo still doesn't work. Is there anything else we have =
to do?
>=20

Hans, I suppose this build on top of the lib inmate in Jailhouse, ie. its l=
oader=20
stub, right? That now expects the Jailhouse Comm Region to be present and f=
illed.

Johannes, try commenting out the revision and signature check in=20
jailhouse/inmates/lib/setup.c for the bare-metal build.

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
jailhouse-dev/cfab21e5-f8ea-15b1-981a-82592abe25c9%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
