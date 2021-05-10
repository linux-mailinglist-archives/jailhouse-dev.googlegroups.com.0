Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBAE34SCAMGQE2VQ2NEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3DF3782D6
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 May 2021 12:40:01 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id v26-20020a2e481a0000b02900bf48f13296sf9018727lja.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 May 2021 03:40:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1620643200; cv=pass;
        d=google.com; s=arc-20160816;
        b=bxqM4yLNU9AexAv+zdUWJegZY5ZASl/YkXQm5NSu3UOmWwj005xHDAtpREULDL3rRV
         yJzhJBCsgmCsdqaCTQJ7lQuDdVEeTjlxtcCACrzBvznSQIXziswnGvVA3gFJdlpKKC2f
         QE8//DgctLkSdb402pGnHigY8+wlXehJz7eQLAZuTH/CiyLZ4l4jaFzBZx4U+E7k/2uR
         6MvPo3VQiSUAryUVZqAwVtpiBDvbfn7jGlJnTYAXmKRlvIdz+NWkG/taJClGwlCa+pRS
         OZTGaONXuy3jDtvRLwD3Y/JxUVg9Wm+6HfJCTfqMzEhJ4XcvsrVMjw9SpP3+2Rwr1sn2
         kfug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:sender:dkim-signature;
        bh=OwaBTocDhlSDVe9ycJUlMfMbSP5+MWtAuwtymlgl7gs=;
        b=C3QiS1/DidDUwLnUrw2LQBiV6AcY1+4VOclkD0HGPQI9umoFx2mzjI9k5WDgLQtTu5
         P7iQmjZ+uYzqD5zPSbk91pQS9Iz+cMOWmL+UTNEiKPdttvzYvg2kLpnsBZ9xtrxC4R7D
         JxDaTvz7aCBQ4c7M2lurnh3QfHQd6BSp2Ipry7FP0Jy5GWBM+oR7mxEqhsnwLeeh80lD
         eINRF2mQGfR1PUch5jH/pzAn6dhFuSXQxfEqJKTkVG+L+DUho2T3b8ZSzhoVcOBAXM5v
         8s9N3e+HZU9UescXxf+uXgvFQL0ZtGYxc9kwVhr7tppKNso606R/5FvWMXJsEw7bSwS0
         mPLg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OwaBTocDhlSDVe9ycJUlMfMbSP5+MWtAuwtymlgl7gs=;
        b=cEg/sqOASo/TOAOXmBIIFf0cQy8HMX40hewsN+Fubz0euFKHSMj3JrCvvf3SnFJwvK
         G6j/8b5YR1DKs9PRRZggd6F01SRf7KQ2E6ZYyRDOjMPUutlxnYC8SzOkVN1uBWUCbJT4
         cNLHA7ua1ueZyVAuGlRIT+ZdXFOcRsNkoZ4jnr4YZTMhEcbx+3QSAv1vxXvn3c78J3IO
         +1zeeLjBlVGouTuH37xV5WKPYrqGQg4MuyI3UfZuxjItSPHr7ZeAPpyojnkgkI1JCLaC
         zW6s5V5boFZ4lty8k/i6qyyGpi29JhIKpgbRD28DmujFy13y+YF3dh9ZpABT8gSiiyJu
         +fvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=OwaBTocDhlSDVe9ycJUlMfMbSP5+MWtAuwtymlgl7gs=;
        b=Pk2c/I4Gcl5p+TGUf18jeMQI49aXnx2SN5QI4zbPl/XbarcYV26tZxPSSahvET/QSN
         Yt55B5R2OOaIanK/iKtsdCFpyge69XNO2ivwzQOIwia7aCxmm0nSN75BsVFccv4QaYXK
         QvXsxY3rVtSZlumdIO5bbhPfD62Z76uMXsU9iaY8JXtlnsYHJ1v6Mgw5w3KRkqhzhlT9
         y3oyPidcQvwB2CNvIUL9mpr6DlBtKrMoOYgGcIEEcPfP9gcdfh01YQ+ZcjZVj6+qVYwV
         16m+aly124WtU9L0osn5wmfyCGP4HqvS0cFDOQzOwmGDshLB/NfA1fJ3/hgdPmN6FF2y
         +oTg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5318DhTl2v9zGr5vh+CsidXj8Gh01PO14UOGE9QAc3lGBYruXneT
	VxSAZWhInFJh0Okq8Cyf8Ys=
X-Google-Smtp-Source: ABdhPJxC7Z/9KROOO5ELDEn9Kih5FdmoLZVNcKV4DRvna7EDdz71aZ7De7Cue1cT9A+00OsFdaxK9Q==
X-Received: by 2002:a19:f017:: with SMTP id p23mr16592196lfc.283.1620643200614;
        Mon, 10 May 2021 03:40:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:6c2:: with SMTP id u2ls3508244lff.3.gmail; Mon, 10
 May 2021 03:39:59 -0700 (PDT)
X-Received: by 2002:a19:c304:: with SMTP id t4mr16230830lff.86.1620643199227;
        Mon, 10 May 2021 03:39:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620643199; cv=none;
        d=google.com; s=arc-20160816;
        b=Hq96uky+11H5a6u1B77lzsVc1khuDyDGNDd3IeBCXUeUzErYp++QhP6X4rtddh20nU
         I7S+ffaUWsaIKy2xNv8ZpfYx7IVRiot2iGapQXQOBJpQCr90OTNaYf2oKJQBRTSzqqVF
         IAdMk7TwIKJVF5RgwJGqPlzztF0uCjd2s4OkSBYS0bY42s5Nsr2evOEZI629mkWFr/fh
         McMoSbM5Pk5YT/lM/V/LFxTYq36SoA+DOOQmGS4Ruz7LzRhmdHnNaoBa4kflku6T5oU7
         kR8h84NQ6K5in8nhqnZi2kjIOssXk6D38v/9VwyPUtVBhFyRPlKjoI3bVLwXbf111WVz
         plXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=bM+4RSNqb09SLeJ3p4ecZ1TMCV6+eWj8xhHAcy+jiMs=;
        b=Q3YprbzqeMYot/5sqmsT83t2yZGgrNgZcTKOjyLiXG7TjIRElafFv9/zQcQ/CYdxB7
         1js49nO9wNOvy9d6sQDXIeg2AeitAYVeu6KNfYCHH73QXL9Zq+5mRrbOflImNOlbOpOz
         LuXtAJ9mE1o7nmNZjOH63o3SMk1DRNz3VjSkZWHvFm1zFt4AaIfJcCgESX0N7OAAec5V
         Je3kqKVpieD7Z8br1DAeYvV3HGYsKH9N08xJv5a5VsIBXbBaydov/Bpu2WFc9RNtb/QC
         I2966vM38+x9w3bRP1OwdYgYtJ6gMJkIYpxu0HIIx5khPXm+IK4+jPbA++IEgq5wV74c
         FQYQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id q6si614789lfc.13.2021.05.10.03.39.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 May 2021 03:39:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 14AAdvjd027186
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 May 2021 12:39:57 +0200
Received: from md1za8fc.ad001.siemens.net ([139.22.38.12])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 14AAaJs9008591;
	Mon, 10 May 2021 12:36:19 +0200
Date: Mon, 10 May 2021 12:36:16 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Prashant Kalikotay <pkali@cimware.in>
Cc: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>,
        jailhouse-dev@googlegroups.com
Subject: Re: Can Jailhouse work with CentOS
Message-ID: <20210510123616.15344255@md1za8fc.ad001.siemens.net>
In-Reply-To: <CACNW3nS7kc-PwpimTmWFtF-MpFar+3Hsx7RFgOCtfpOOdxFszw@mail.gmail.com>
References: <299a190c-72fb-1027-0efc-7a45b98bffe0@cimware.in>
	<AS8PR02MB666300B8BE60E746F395D53DB6579@AS8PR02MB6663.eurprd02.prod.outlook.com>
	<CACNW3nS7kc-PwpimTmWFtF-MpFar+3Hsx7RFgOCtfpOOdxFszw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
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

There is no reason for "sudo" for a simple "make". It is likely you are
missing kernel sources, or tools that the build process needs. Or -
given that distro - things are outdated. Jailhouse does not need much,
but also centos does not offer much ;)

try a fresh clone, no "sudo", "make V=3D1 -j1"

Henning

Am Sat, 8 May 2021 11:19:01 +0530
schrieb Prashant Kalikotay <pkali@cimware.in>:

> Thank you so much for your reply. While my installation I run sudo
> make and that fails with the error : /path/to/build no such file or
> directory is present. I checked the path/to/build and it exists and i
> have also given superuser privileges to the user.
> Could anyone get me anything on this. I am using CentOS 8.
>=20
> Regards,
> Prashant K
>=20
> On Fri, 7 May 2021, 14:37 Bram Hooimeijer, <
> bram.hooimeijer@prodrive-technologies.com> wrote:
>=20
> > =20
> > > Dear Sir/Madam,
> > >
> > >                              I am trying to install jailhouse in
> > > CentOS =20
> > but the installation did =20
> > > not work or it did not get installed. Whereas when I tried to
> > > install in =20
> > Ubuntu =20
> > > it readily installed. My query is does Jailhouse install in
> > > CentOS or is =20
> > there any =20
> > > additional things to be done to install it?. =20
> >
> > What errors do you get? Maybe there's someone on the list who
> > encountered those before.
> >
> > As far as I know, Jailhouse should run given that the kernel is
> > properly configured.
> > For newer Linux kernels, you might need some patches:
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fgit.=
kiszka.org%2F%3Fp%3Dlinux.git%3Ba%3Dsummary&amp;data=3D04%7C01%7Cde173c00-e=
982-4fda-8644-47edf4671d63%40ad011.siemens.com%7C0e6b87ebf9ab493372b708d911=
e504e8%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637560497853991126%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C2000&amp;sdata=3DppGRrGseipDA4Jlu%2BQkvXdFOCw5RKP8P6Y2LD6Nh4i=
Y%3D&amp;reserved=3D0
> > I have it running with minimal modifications on Linux 5.4
> >
> > Best, Bram Hooimeijer
> >
> > =20
> > >
> > > Thanking you in advance.
> > >
> > >
> > > Regards,
> > >
> > > Prashant K
> > >
> > > -- =20
> > =20
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20210510123616.15344255%40md1za8fc.ad001.siemens.net.
