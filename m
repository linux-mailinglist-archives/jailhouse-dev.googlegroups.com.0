Return-Path: <jailhouse-dev+bncBCOKB247TIDBBCHBS3XQKGQEYEVYP2A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 3435110F438
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Dec 2019 01:47:05 +0100 (CET)
Received: by mail-wr1-x43e.google.com with SMTP id f17sf826393wrt.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Dec 2019 16:47:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575334024; cv=pass;
        d=google.com; s=arc-20160816;
        b=iQyaMabWw/PbfxJrVy9yHnWzl4AgdGrDGV4VgCfOITrnxFy40vuhnzpOzxdY9XTOU3
         OQJLerFCq/KgeBCHs+mJUAyUK7OcjloaCMk0MCLNE+EAZuln2y8K7j+IHy2Rh2Olen3j
         QsXB4XyOuBYHHGi0TKTJHLFEHNwdQGQJ84iDXcpv9gch8AdqzR4gHKJC2oJiTgjls8hi
         g8JtLdcf71pwDtY937EEdzBAQ0BC7vonzbs2+oW03KNIpmFZMtNw56KIxx+YFPCDF4MI
         xPdVTRFPJ52Edn/JBGUAY0PYeAFMYhvV3UxC+VfRy+adZz9fyOWaapFfZEzvwfL14N3g
         4OLA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=sO1gQs4jlDWmnLh8VVsWCqt+Ize10ho39wEdXtWa+3Y=;
        b=dU3CUxYd+QZ8uU2UR9v0nkX/9Egm5JS8Nro5DV23L8ZljBr/kB13prnJlaJn3A+ulc
         QXmDtgDPULn6y/FJZROYXaP0CWIaIY8dT6E/k/02n+BcnCS0m71MLd3tWCWzIVpWZ0nb
         qpePG1M60AznGI8L/xWh0Ih+F90z6cVkfPqClSkAjyrg7hqZXpgs4CpRXIgJo20Qbu8p
         j9XTr0BOfq6fvCVnZ1KWvGyoF8qtmcAXh4UG+DYo0qTo7y2/G4afUAqStBgfs8Ybb3X+
         /pmeHdIShGLVDB4rjuzKv9oW5OXutYfPOS4DdmwI9wz234CfeOGcJJK8TcuUYHYDhhb1
         6w3g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=izi6t4gC;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::343 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=sO1gQs4jlDWmnLh8VVsWCqt+Ize10ho39wEdXtWa+3Y=;
        b=BQDt6orveyb7JE0rBKSemXh72JuFZ54/RfHIS2UnylvIKSKQdSjIn5tpYKtUkLN1c3
         w90R1YBbxsXBTXl7u1u2+xP086wudLdkoO//A+jG31tzq3pFzgpvRoZXaoeGj5zH2aKt
         2MXQipKUNVRfBjqlHzTCcRo22Czh8H0M5n6PdiFtVP4tKymYKN1RMCuLIogQmWh3eLLA
         60iLtPQiLYEpJ+jY4Z0Oc1cHH7zUe98BQzXaJtDvKm3+QrR2xR8s1qY1FwyDxANSaxLa
         T46EbuURZoP1DPGiaX/8e4Sz3kn9wvgV7ZF3WAKCGkK6AnV7UMOm0wYnHvOkKAw7YnSO
         8wKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=sO1gQs4jlDWmnLh8VVsWCqt+Ize10ho39wEdXtWa+3Y=;
        b=oDc6Gul0e3lYV212Sd0sASGGMKhAl0nTBFzhmXHZUyCinCONYwN4gEhwZ2gYBmd/j3
         4UF+xwHere/o11arF0omvgLt6hQVF/cL8xr50MGlRg3U9ZxM+eDlwlJpIORToeygdPeP
         G57BzS9eA81BENbHc+sF916pMlgHUzYr2XiK5OTG7sa/UVK8KLXe8dMgnka/oPv1mzi4
         Fz0yfdx6OARJCoTXjC6JPYnPHjVPp9jhzPix6fbJFP/rs/KMSHy/p4kr9P3xOnx/uIq4
         IooB1bUu6JhXk3+oQrsC3B1aHJbqM0uZg4thXX/r6xT23IEQhnyQ8dakXlmIVEeobLXT
         MzZA==
X-Gm-Message-State: APjAAAXf7ThNRJ9zg0syrawHORvMmTO0DtEd6IOdC3v0Au/7hrQ42sCS
	I7KIfLyLO+fYeLf0uawZi78=
X-Google-Smtp-Source: APXvYqwsIkDGI8UkKj0ufbVlUHGIUznbYwML55C5ZDkpBmZPTTMl+6v9DEUn7ABJxax2cpWiYMs5RQ==
X-Received: by 2002:adf:e40f:: with SMTP id g15mr2016374wrm.223.1575334024812;
        Mon, 02 Dec 2019 16:47:04 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6303:: with SMTP id i3ls516675wru.13.gmail; Mon, 02 Dec
 2019 16:47:04 -0800 (PST)
X-Received: by 2002:adf:c145:: with SMTP id w5mr1943249wre.205.1575334024178;
        Mon, 02 Dec 2019 16:47:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575334024; cv=none;
        d=google.com; s=arc-20160816;
        b=cW9ogxGGCONCPC2iWAFiNXxvewIRRChvZ6QJnjS4+E8aacn1W4YWarhOP8VTiAUcXL
         oDO2naBP6Mn19XQiC/fVuMGVWcRezhJDWInoaLknxu/bPZMEovsUKWGSCCymdLt3sQrs
         0ghWN6QdpoVLEEYBCs7PEzhqt3PZ7++GZyR62pUVFPE5kj5+IP5iiOMWrQqlb/xwaYcm
         Y2SjbnCaeftXBmJWn+S9gqPFGlVjNcuCRTAXulRL7uVzR9jq3Ix86CthjBKpkIGD2CNP
         wZUyRPtFD4OB2E8cr+aNlhW6YDUq2rw9NMMgZfGwIHW/OwZp87iOz1PWsJZM1leREVG4
         zQLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=/IOS8SGzHkQxOXEZRhxRt8f38/BMx9BQK6mpASCFEIk=;
        b=FNRHagOpwJClTO4q+7F6kkl6JEWEWr8c3b3ZfbP8xFK3j069O1OpBNTV/khRM2dBJb
         BpgspY7AQBlXjxbLhyXrDB7FmMEOxh/WP1FMtTTIklmToCAhBMMl9VxWZRNfCId7ru7q
         jxPbH/5FG0Cj9terFS3jl8jd5HTvEp5fDtrW6z5MtH2jj6M4waZl7NQuFP6DkZ+s0vSo
         kaxqucStsi5n7p+YNx1qDA7rJ2HRtKdirHDyYND5qsFdoyGqKBp4JtRAbgGxi5wvOal5
         ELW5llKDKLZYdkVDwzepg5vpJA/ZiRHbC8/pxnc0a4BnYot4chm9trG2Z89JXCsI+ZIK
         +Caw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=izi6t4gC;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::343 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com. [2a00:1450:4864:20::343])
        by gmr-mx.google.com with ESMTPS id p16si47134wre.4.2019.12.02.16.47.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2019 16:47:04 -0800 (PST)
Received-SPF: pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::343 as permitted sender) client-ip=2a00:1450:4864:20::343;
Received: by mail-wm1-x343.google.com with SMTP id p17so1575283wmi.3
        for <jailhouse-dev@googlegroups.com>; Mon, 02 Dec 2019 16:47:04 -0800 (PST)
X-Received: by 2002:a1c:1b15:: with SMTP id b21mr24056190wmb.104.1575334023762;
        Mon, 02 Dec 2019 16:47:03 -0800 (PST)
Received: from localhost (217-133-116-244.static.clienti.tiscali.it. [217.133.116.244])
        by smtp.gmail.com with ESMTPSA id h127sm1133522wme.31.2019.12.02.16.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 16:47:02 -0800 (PST)
Date: Tue, 3 Dec 2019 01:47:00 +0100
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Jailhouse <jailhouse-dev@googlegroups.com>,
	"marko.bertogna@unimore.it" <marko.bertogna@unimore.it>,
	"tomasz.kloda@unimore.it" <tomasz.kloda@unimore.it>,
	"giulioc@xilinx.com" <giulioc@xilinx.com>,
	"'claudio@evidence.eu.com'" <claudio@evidence.eu.com>,
	"fabio.federici@utrc.utc.com" <fabio.federici@utrc.utc.com>
Subject: Re: [PATCH 0/8] Add cache coloring support for Arm
Message-ID: <20191203004700.cw7fgubui363mxee@carbon.xt3.it>
References: <20190327121849.1882-1-ms@xt3.it>
 <AM0PR04MB4481B3186519C11BBFEE8DBA88430@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <AM0PR04MB44818E5F2BA11C16A6B9E70088430@AM0PR04MB4481.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ttse5rxsvi2e2cmp"
Content-Disposition: inline
In-Reply-To: <AM0PR04MB44818E5F2BA11C16A6B9E70088430@AM0PR04MB4481.eurprd04.prod.outlook.com>
User-Agent: NeoMutt/20180716
X-Original-Sender: marco.solieri@unimore.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@unimore.it header.s=google header.b=izi6t4gC;       spf=pass
 (google.com: domain of marco.solieri@unimore.it designates
 2a00:1450:4864:20::343 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
X-Original-From: Marco Solieri <marco.solieri@unimore.it>
Reply-To: Marco Solieri <marco.solieri@unimore.it>
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


--ttse5rxsvi2e2cmp
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Dear Peng,

On Mon, Dec 02, 2019 at 02:52:04AM +0000, Peng Fan wrote:
> > I am reading the patchset, but this patchset could not resolve the cach=
e
> > contention between root cell Linux and inmate cell, right? It only addr=
ess
> > the cache contention inside the inmate cell, if I understand correctly.

This is correct.  The documentation reads:

| Since Jailhouse is currently lacking SMMU support, and since the colored
| memory mapping must be provided to DMA devices to allow them a coherent m=
emory
| view, coloring for this kind of devices is not available. This also expla=
ins
| why also coloring support for the Linux root cell is not provided, althou=
gh
| possible and tested with a simple hot remapping procedure.

> > Is there any v2 plan to address the upper issue?

Forward porting to master and integration with SMMU support are the two mos=
t
important task on my team TODO list. Once these steps are done, it will be =
very
easy to also have root-cell colouring. I have planned the firsts for 20Q1.


> > To address root cell color issue, 1:1 mapping in root cell might not wo=
rk,
> > because IPA/PA needs a remap, but this will waste PA space, if inmate o=
nly
> > need a small area PA space. Seems root/inmate cache contention is hard =
to
> > avoid.

Beside root cell colouring, PA waste is a potential issue of colouring itse=
lf,
whenever you have heterogeneous memory needs across cells. Still, on most
high-end systems the size of the shared cache easily allows for 8 or 16 col=
ours,
which means that the smallest PA granularity to assign to a given cell is 1=
/8 or
1/16, which is an acceptable limitation.

Cheers.

--=20
Marco Solieri, Ph.D.
Research Fellow

High-Performance Real-Time Lab
Universit=C3=A0 degli Studi di Modena e Reggio Emilia
Ufficio 1.37 - Edificio Matematica - 213/b, via Campi - 41125 Modena
Tel: +39-059-205-55-10  -- OpenPGP: Ox75822E7E

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20191203004700.cw7fgubui363mxee%40carbon.xt3.it.

--ttse5rxsvi2e2cmp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOC2XMK2o3tvc3F09Ctn83XWCLn4FAl3lsIQACgkQCtn83XWC
Ln5XlBAAgcMeUOl+Q3lbwypbGj1qkn2z6Sw5+zJlNcxdlFTjd9usQsKUORy2qBh6
N4FKP3EDu8OhHCdeU6yfU8h4ZLhJRb0BkXXjB6vW1M6baXRVl1w5wcTShsDNZL/+
sjEKdM03RTdvsKNr/m9vh30q4mDUkmgLD52KVCVQrlAWFjiJohTb/Fu4BiUto8rU
EbJ9WtxfpBT2wjnZnPN8ajD2eLsCroFEXMbLLjZGLVh49XFJiYlvuK8lwFLDlR1l
5zB0POThxBBH5bV4yphme9Avcg/SlvuEYvHBsUbT1q4GXcwM8BsiwQDWurM6v49o
1tAT62gl4L60iOcSGpab2oAvOyusk9u2Tc0sMrcmHau9dxrDCxy0/Vzyw9bvFAQx
UUkr9zJe/r8KZeM4H80503UoR64ORzOKz0ixqrMyi5IQR3hsdkwWfNcKHpjG06J1
ZWCea6VuyQlLhaJDfRiP4CzZyUEiqb5vUDbNrH9Y6bFHK1LlootysAjZ6sVjX36v
q3XtZ6fs5d5YEJY2v8Q7VFNd9ZCwNxhCWmvM/wu73pmHC0F3ipryeQ23wrkhC9WI
AToa6bdsKMgUzzqdF8VtEIzxxGVpglov3Dh8xhs6Y8GSK+qwci4rY9xxomnL5MLJ
XHYRHt4UU4a132dQ1qpUpAhJw4S5Rd+lr6NZKDYlPtODNBUchvU=
=dQfl
-----END PGP SIGNATURE-----

--ttse5rxsvi2e2cmp--
