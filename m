Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBVO6Z3VAKGQEGBIN2RQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B988CC16
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Aug 2019 08:51:06 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id q9sf11577721wrc.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Aug 2019 23:51:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565765463; cv=pass;
        d=google.com; s=arc-20160816;
        b=eNqGdLW7K5iIK/nGLjd/kPQWrTdvlNvA7btVxLhrtqIWMhSBPJWPaQgnq9uyN8pVOP
         pFTJLbSeNQHt5JTZMcsj/KO9mRSzqFTkJw4bc1pidoivth0xKCHAy7VDQOCWTzQsY6gL
         1LOqMfGs3NFTcZASzOfqKaLivw7nM4g4ELQXIgH0LvLSKMyQ4Ap1ipDqduItaqLL7WNk
         7TuZQuHkEJ3vBxCoMuEn0ka6JuAE6Hk3uFQqWIoFnkrnaU7inWq84qTcstTBU1O6x75b
         htJZh+ESTu2QtvMbq5pGMWTpC50/kYW7nSSiUWQakxhK9gWM4qmvXKVbY4G9fsIHPEsG
         dguw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:sender:dkim-signature;
        bh=lT2rT3ivhdgj5hhcTu47CXh0ZQImKUCOGrrq7FmWIRg=;
        b=CZEGo9ixXIVocrqbJCNV2jZyXKiGTRndMW51/zBIQgtppO196gZV9NGpTBEBt0h/p3
         26SLc4cwVSqfKeaGDfpAhjSGsxX9bTHPrthmqdK3fWyWGp6sqynIGf5zE3nXImkAjmKT
         xKK2T1XpPvyMGnO/7lM9DXd0k9h07ZaS9g4mS9oST5t3r9bfOhpdagfAVXFPcsqSRZ8F
         G1pV5lS/71tsAZbk9upG4R8ophV0Pv1icHAein97LOZaEC8mjm7AdtefQGQQw4y4OK/h
         ltFjEkggxFQr7tbFRzbqvCdLCTyBFVP1CSVCDXtprilM0MnYDpZU6ML+9JknUuDhSEeA
         QPBg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lT2rT3ivhdgj5hhcTu47CXh0ZQImKUCOGrrq7FmWIRg=;
        b=WP4g6GBgIB2aGbv4tRvWUpnP7V5xOVFnc27VZqiRvxE/HH6pjSTfMlc5VlT0G/uvih
         gwmInzCXikKpZhN1zn5U8MdhLHea95LlpWsKL/q+jHR9B0hMN92aigaUXnuTzSRCNCw4
         ldmOpN5VF68smOblAdpPqkk/rPRScijyPTa52LlIBK8GZZaVuvBoUUQd4jg0+aZBWrKS
         3WP1fTZIJIRlTrZC2LhgADxajcICQ5xG46q1+iNxqO55mHzWZX0myKMikHg328sIDX4F
         pWDMIU05fzXRAgOoVzybsAzVAEJfcXs6pTOBtR7LPVJwJBRA0TmbRQUT57UaK1bnpKvt
         SlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=lT2rT3ivhdgj5hhcTu47CXh0ZQImKUCOGrrq7FmWIRg=;
        b=N/wcnkh4tgZANQ+Pw2hLxGBH9R2MTzTHR4eNkITmIp8ElK2aGVcw/8/pkldLQcbFbf
         6QZMcGcCaigW6dcBIMMmmhIJDRQ6+/WKF3VziK+Q3or0FLm9wVDtbgrtlY8QvL7ZHZC4
         pXcW8WE6gt6mbXPGotQZn8b/bqhEoc8yfnWluOd7YknNASj6DhuQHNWGlh+FzMc56wKK
         bFswvunZZ8ZuF2QSkS6OF9dqy5G89vcQHTVLAhvLrbWlIgA6KFDxYefZiAGUALPI5DDR
         kym7L5pC4kc0Xg2UjmDymKFdxukmZN1kFi8TKCQR2KgyQUPlEGDvfqlTvZ1O55qmpEGg
         92fw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU85EWrt/peYOgRwbAyF1m7F1jlh9F/Lc0+hKbo2AGebSn+69fE
	jEHsB7HWr0DSQJoTUJJN6LE=
X-Google-Smtp-Source: APXvYqz0k+GQfBg9L61IP1IEsdEwNaSf/iwZp+hSR1AGCf8jQH7i+J9q2WfXDN4ozevqfoGrnliN5g==
X-Received: by 2002:a7b:cb89:: with SMTP id m9mr6919766wmi.50.1565765461814;
        Tue, 13 Aug 2019 23:51:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a557:: with SMTP id o84ls406656wme.3.gmail; Tue, 13 Aug
 2019 23:51:01 -0700 (PDT)
X-Received: by 2002:a7b:cb5a:: with SMTP id v26mr6946407wmj.76.1565765461011;
        Tue, 13 Aug 2019 23:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565765461; cv=none;
        d=google.com; s=arc-20160816;
        b=kNPfVbaGkyO2t3zPTmO7YkgVQpstIyw5sAiIjNTjwH68BzlDzbQiIMKIeBV++S8e2D
         i5a4qxLh13rn1Owcic+fAOqqF5r1DwoX/DwhOLyoWmkL0R0kEibynUCOUd2Vw3MYbFCf
         i6pUpgahuHwQP3pmCrJ/bqcUdFWiHqXawPjS+8RB9xXq56PpGiIj89BdNC3xzzQdJ+FN
         PdWGHqZWfxh600waJ7iyt9A7aQb7SWMkh0Slm7QP4Z9TkKlPk4IwvQR46c0HVEeli0TQ
         IFCH/4XP1Qy/d6loXUNKtX2SWx3ErliJnaRm2Y+auH7FVtceHpShboPc46NO14evjvdI
         Lk4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=sog1hI+Nx1mk3MruQl5GrZz953v5BGcGQvVRWPx/deQ=;
        b=cdWI9dvMwDfxOIy71Y+S/dv2RvY9gCGF9439CTiT03o0/5zJLB0392uqg0q9yx3Lys
         qML1XhMuRVw/kjnLIaAbXW0xSzoL80FXp1Motu/HcaQKmu1UMKkd3wjqpMYEv2EFosme
         b03xB3a/tflKRn1wx1D1anWW49rnH4XQ+os3tUJHkGctWlz3vksk8Akhl133RJVDosub
         qGqona88T44o0DOvcPslplw+bl7H8Bs8SSXBq1S2No3+RVKq7yHpjhqtawfwvNagYb2n
         UIuIaynpn4smD12pc5w/wUTJ8cXXxlFqK9jyTAyOlSiWw2TS0Bng92r86CGYjzd5DCUd
         2XGw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id p4si92017wme.2.2019.08.13.23.51.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Aug 2019 23:51:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x7E6p0s5021447
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Aug 2019 08:51:00 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.68.225])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x7E6p0Cm005395;
	Wed, 14 Aug 2019 08:51:00 +0200
Date: Wed, 14 Aug 2019 08:50:57 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Cevat =?UTF-8?B?Qm9zdGFuY8Sxb8SfbHU=?= <bostancioglucevat@gmail.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
Subject: Re: Orange Pi Zero Jailhouse Yocto Integration
Message-ID: <20190814085057.43ce8c63@md1za8fc.ad001.siemens.net>
In-Reply-To: <CABPcKDNb9HKXNHGoUY84WnFup2wn79zsoHzDa-i2xeaETM7VDQ@mail.gmail.com>
References: <CABPcKDPEVAW0Y1x8ndpc6LQutq8cCsEKu20inFyFhrMRwa+--w@mail.gmail.com>
	<a17c3513-f573-84ad-5d4e-5027121e51b5@siemens.com>
	<CABPcKDNb9HKXNHGoUY84WnFup2wn79zsoHzDa-i2xeaETM7VDQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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

Hi,

i did not look into the problem yet. But my jailhouse layer for yocto
is on github.

https://github.com/henning-schild-work/meta-jailhouse

Have a look at the branch henning/staging for patches to get a more
recent jailhouse to work.

Henning

Am Tue, 13 Aug 2019 14:31:36 +0300
schrieb Cevat Bostanc=C4=B1o=C4=9Flu <bostancioglucevat@gmail.com>:

> Hello,
> Thanks for the fast reply,
>=20
> I tried with 9f233898917f8c1141132606f2f2c624405d8c81 commit and also
> latest commit, still have same problem.
>=20
> I will be appreciated if you guys can provide/help with examples.
>=20
> Thanks,
> Cevat
>=20
> Jan Kiszka <jan.kiszka@siemens.com>, 13 A=C4=9Fu 2019 Sal, 14:09 tarihind=
e
> =C5=9Funu yazd=C4=B1:
>=20
> > On 13.08.19 12:39, Cevat Bostanc=C4=B1o=C4=9Flu wrote: =20
> > > Hello,
> > > I am trying to learn/play embedded virtualization tools and i saw
> > > Isar Integrated jailhouse-image repo, tested orange pi
> > > zero(256mb) image and everything is fine.
> > > I am trying to integrate latest jailhouse(0.11) into yocto
> > > project and i =20
> > saw =20
> > > https://bitbucket.org/retotech/meta-jailhouse/src/master/ , which
> > > is =20
> > for banana =20
> > > pi with jailhouse_0.8.
> > >
> > > Anyway, I ported jailhouse-images and meta-jailhouse =20
> > together(meta-orangepi, =20
> > > https://github.com/cevatbostancioglu/meta-orangepi/tree/dev) and
> > > trying =20
> > to =20
> > > compile for orange pi zero(256mb) but I saw many errors while
> > > building. =20
> > can you =20
> > > guys can guess what is the problem?
> > >
> > > my status:
> > > i am trying to build exact image with jailhouse-images so i
> > > patched =20
> > u-boot & =20
> > > kernel, now i am trying to compile/install jailhouse.
> > >
> > > You can see build error as follows,
> > > also attached log outputs too.
> > > =20
> >
> > The errors look like they could get better with
> >
> > https://github.com/siemens/jailhouse/commit/9f233898917f8c1141132606f2f=
2c624405d8c81
> > =20
> > > My repo:
> > > https://github.com/cevatbostancioglu/meta-orangepi/tree/dev
> > > =20
> >
> > Thanks for sharing. Henning did some yocto'ization for an internal
> > Jailhouse
> > project recently (though that was for legacy vendor BSP) - maybe he
> > can share
> > some thoughts on your direction.
> >
> > Jan
> >
> > --
> > Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> > Corporate Competence Center Embedded Linux
> > =20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20190814085057.43ce8c63%40md1za8fc.ad001.siemens.net.
