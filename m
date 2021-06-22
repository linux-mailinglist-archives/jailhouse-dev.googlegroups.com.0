Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBM77Y2DAMGQEXP65W6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63f.google.com (mail-ej1-x63f.google.com [IPv6:2a00:1450:4864:20::63f])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7C83B01B1
	for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Jun 2021 12:47:15 +0200 (CEST)
Received: by mail-ej1-x63f.google.com with SMTP id z6-20020a17090665c6b02903700252d1ccsf7426461ejn.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Jun 2021 03:47:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1624358835; cv=pass;
        d=google.com; s=arc-20160816;
        b=yse2wGnk7PO0mbTU0753q8ajvLNJanjI4MnX0b9xM59GCirXz/HZ92zUbWyPXB5gOy
         Dwg/ZqBqOfEuJxDwrqOXCh0Qy5ou4911OKFlZOOPHhJqspyEewLbsMQd2NSO6dj+/2cx
         SgRtl1dJ6KRucznCBtr9rsEEBOhs0XvJ2VpqjF/AzJWcKCVNHcFwZbRZvx4XpYqqms6D
         J2/+IJj11/fU3CUHtF7ED5Hz3BU2D/huG2gDapxGFIGpHpAIRZqaGcLTpiKMgtgXzAVN
         36qhrhi5OwJ+Y1QTIoRVvc58sy70MpcH2CaZWeSLHdSfQIwWwKtYsDuQPIemk4/loN0S
         6H+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=55NeCeICTAjesqPowcmPO759D8njud3tSBU/2AvbpPo=;
        b=sIGoKozk2WVap6CzFikCtRUeaoRjf+OLAIDyJaCOPa7IUmnOj9GAGyw/+oZMYW+9rr
         sdlv8LjmxYvbP5x+FBrXJmC6kyVs2JisNT4tKL/lTfcqRTO0HcRqQs6L2KNBd4QHgwOW
         sfiHAUHiulP4XzIBUHsfp+U0WxpIqRAlnib01/B7lJfD0yqmfIj2Z876pLjYTvzBHWv5
         FO7WzHtV670mJcMCEcSqIbSRBbUcewSIlun9SWo4/7XZ4q0vqHFkZlxpFHlDR4pI8r0k
         PTbNSIgDAFnAMQWx6N2lMDD+Cht8q0wvxLawP/j0ETJ5084BrQbMa6I0n/xqMZNF41n3
         f6sA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=kq8DYAyy;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=55NeCeICTAjesqPowcmPO759D8njud3tSBU/2AvbpPo=;
        b=pzpTKQO9tUEhbUcNn0DuOxqVtcTgFldVKto1LZ2OrSaCxEWrg2SPlZ9bQchOiC5OMF
         YqlxP4hmmcKlwYD8ftpsAyBnMdjeovV5iyrKRoNvX2i5GBffa/hh+2Zs5zeuiWLJED1W
         8RILfIp5PMRd2ELNSW8XikgL5iayQHNIlrQrWZPfveudWgRd2o56t6yjt1B4MsR0CQqX
         2gUTNOrndU3gM9yb0P0AvVNkkLJsMgZjbvem+mM7cTBztVsui52AFxs9kApTRzVrKpF4
         P6cntDaaUxklcJ8vfSmbzV03HDzOYdBUwDp3/EB2XTsyizO15K2jBWDYs92qNOepfRkT
         D8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=55NeCeICTAjesqPowcmPO759D8njud3tSBU/2AvbpPo=;
        b=ch4FaTwh7Q25rQM0sSrZiFY6P4vuLpdWbcMQflr1SfE9ZZhX1hkqjkyRK83DFtdvHk
         +v5Vg0rfbBOmViOp42qKyfQOLFc1I9qXp74pUn4+GJA4dBE1+cepS2Q5W7S+0t9zoJiZ
         T2qoo1HrAshnU0PQP0lKlKlW5rk2BYvPZrVLZNVCPN52SBfQtfWChGIlPwf/DL+k+VdQ
         To6p5LznAfxRLdvWL76C/Vf36dljxr1c85tAJ0Gw0psgFCE0p+OhCA21qCoLcdCsJ2l6
         4+f9hfvm8LWD15tpBIhWcpakAMTUwRopGUX/jddBf9pc8PydjXiwuU34MTCE8oEokf29
         1Z/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Vi+C95Pl9zRxHBF41cizgabaqBP5YHpvzpLCWgybldNboNfxZ
	GLbEOi1CT74rx7pvSRXUr7I=
X-Google-Smtp-Source: ABdhPJzh9xIaJoHlekFXt2PZWikm7aRpviXBsWXe3N8Nqa3kGTHWt6zM95qhgBUSEHehVorhOKVBbw==
X-Received: by 2002:aa7:d707:: with SMTP id t7mr4000345edq.11.1624358835553;
        Tue, 22 Jun 2021 03:47:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c5d2:: with SMTP id h18ls4733014eds.0.gmail; Tue, 22 Jun
 2021 03:47:14 -0700 (PDT)
X-Received: by 2002:a05:6402:1508:: with SMTP id f8mr3977340edw.172.1624358834499;
        Tue, 22 Jun 2021 03:47:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624358834; cv=none;
        d=google.com; s=arc-20160816;
        b=b/yLIoArS09/vXXfz6dDvjzRFXW83cS9ztDZ0xMe4tCRmqs3hCX9tzJ4VIrdDctyF9
         vSiK7xUBjZ2P4wIfMqy5jAzk1z0umtF0D712HousMVKQMkT8Ao7rjcBvJwgJA4NZbByc
         unW4ahwY+Rfkn39tQwTOWQ5QStJ9ymxwo9DIA+DRKZuc6BcJKOUwIM3A81TZ9f4v4Xe5
         q+xL6lo6woQ9IBF4viGoi9rASiX4A7KFdwSLwkljstSEZVUVo13joS3oCLsby3WdpV5t
         6vMbuTNgVwPlrKMMNWadLDwXxwvDqPjflOoFBJYRAZaKFdwMTqZsgVx/GUo3skwpfcp5
         3+2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=g86aiBCBfpTBHA5t7ZYzYBgYDL4+VDkyHnE7zOyt0K0=;
        b=s2XmBMn1RQbyLUI3l2hcs8PGXPAeqHInuq+fHJXCm6t6Xyz437fZYquryZ+eijLdrI
         HdA1jJrLWfDDMWUurgRjXQtbRdgWADG89zwUpjHwTdryj7VUAFilBGRPfd9efzq6ZHiO
         E9QDBbdLJMEhI6qBThEy1w8fesrkWLZk5pExNIEcs2PzAT8l5ML1JBEWGbKnB9ZZQX/u
         aPt5KKYuP6FKA1up4IPN+eM7zY/w2ZgV8KOTVJoV2v8pYLtUPAWZLMaCew/P8F+3jEb3
         jYaH6FouwgQevdKcZseCCJBhZtdpoZEZeR7ousgNaJcu3aK5Gphuy2OePlr8Oj6obw+X
         GsYw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=kq8DYAyy;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id u19si135756edo.4.2021.06.22.03.47.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Jun 2021 03:47:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4G8NPt0X3Lzy1q;
	Tue, 22 Jun 2021 12:47:14 +0200 (CEST)
Received: from [IPv6:2a02:810d:8fc0:44bc::5f8c] (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 22 Jun 2021 12:47:13 +0200
Subject: Re: Will jailhouse support RISC-V in the future?
To: along li <v6543210@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <bc9a4b42-034e-4be9-b364-ee5f6e2964a1n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <a6533b1e-4149-a0af-0e98-38f18ac77e8d@oth-regensburg.de>
Date: Tue, 22 Jun 2021 12:47:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bc9a4b42-034e-4be9-b364-ee5f6e2964a1n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=kq8DYAyy;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 22/06/2021 12:05, along li wrote:
> Hello community!
> RISC-V is very hot now.
> Hypervisor on RISC-V is=C2=A0 starting.=C2=A0=C2=A0
> Xvisor is doing some for RISC-V=C2=A0
> Xvisor_Embedded_Hypervisor_for_RISCV_v5.pdf
> <http://xhypervisor.org/pdf/Xvisor_Embedded_Hypervisor_for_RISCV_v5.pdf>
> And this video in=C2=A0youtube
> <https://www.youtube.com/watch?v=3DeNUn9uMPcCs&ab_channel=3DTheLinuxFound=
ation>=C2=A0.
> Will jailhouse support RISC-V in the future ?

Please have a look at the wip/riscv branch.

  Ralf

>=20
>=20
>=20
>=20
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/bc9a4b42-034e-4be9-b364-e=
e5f6e2964a1n%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/bc9a4b42-034e-4be9-b364-=
ee5f6e2964a1n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a6533b1e-4149-a0af-0e98-38f18ac77e8d%40oth-regensburg.de.
