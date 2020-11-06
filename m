Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQHPST6QKGQEU5WGWNI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 572A72A95AB
	for <lists+jailhouse-dev@lfdr.de>; Fri,  6 Nov 2020 12:47:13 +0100 (CET)
Received: by mail-wr1-x43e.google.com with SMTP id v14sf378134wro.12
        for <lists+jailhouse-dev@lfdr.de>; Fri, 06 Nov 2020 03:47:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604663233; cv=pass;
        d=google.com; s=arc-20160816;
        b=mgnrqK4ajUOnPvbwsa9LQp0vFTlkKoLieCdYoeUK5dIqttBVg2KfivhVL4Z9WiirGK
         7GaypgCPAxnN/nMq938TnpviGqJez7yy65sJze2mwxFBVFZmXjA865+zqhB4hgEb9TOW
         h0FTNikHGoaz+1TvddXISuE3TtEu/iBE+JTHxwXWTT/BP/g/9DoCBXetjnkkeD7sJABo
         OhQYCyJXydI83ttPAQMzHvZx53cBL7FWbw3nLG54pLgGe7FuL9YBg9YBXtci/qdIzFwT
         FPPcGhcUp2trPkk556RGzs+mWN/rJySkkorGbyxU5+ikWYbMrCedCpMuCYKQXJgIv8yQ
         DGyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=s+XjbXMbjNiqtftPqptbCrcN4QoEaV2TX4bfgSjL1Qo=;
        b=TsCRum5FLioNkkdoJj/cg/5VIxrIfrnOGefmeq8YsdmHh7SkuC2NLPjmM/fPsnKCG8
         9Z25y/gOISGgO8GQIU8kpY0L5uL8588GZ/rydmfNJHSe1rz0tzyzWqo4NqkMVIdEnqqC
         4LZYBxSGoEiutVjB7uUf2X0AzQm/zU8J7NJ6oKrU4FfTBNS14/2qO3CkBNclbs4DSMYs
         w9a4vmhYpzwQ4SDT20ACD7PLpuPqlK/NhT1Bul8TAqhUwkqVKA0GeAYRBl1HWybMCNNn
         T1DhLoPYneS1+GNgqG5m3lcB6lPGQLIckJGlkHzEpyKXjx+Or5dFOhrD/lNuxikxPNxJ
         NC2Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=s+XjbXMbjNiqtftPqptbCrcN4QoEaV2TX4bfgSjL1Qo=;
        b=CxwxPx1P9pU4qd89wgUQF+eV7wBVu3vjUm4NyEmJKLEQv91bKk/vHMYXPvzCnoCVqU
         fcTB0cohQUPjbuDb9R7FhKX40nS97hF3tz/8nVuWyEgzdzoZx/+aFV6OPlhK4VzknZpK
         eeg3Ji94pDCwgtyG56oTGZFNs9/SUCo/DXEQBqEjZOhEkxef/TwHKmM4rtEJupbH3EDq
         RCE6VZvn6GnyVRh/h7NL2bXQ1Ih9MFzghDYg7m2G5IP1rPovKrVgoTy7gRvM26FE1jTs
         sNQqCyVPCyWl7ZsSGDskUqHqIHkgxAz/Usox4/WsibkZirUwR/HDHKWlMuXYW3yg0onk
         Ksww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=s+XjbXMbjNiqtftPqptbCrcN4QoEaV2TX4bfgSjL1Qo=;
        b=Hbu63S1Es8p8eVCWjA0/eTtzYeCwD0UTPJQo7ShwPAZvy5KX4C9T0g2vSQOn/qaXek
         CNfqEPbXMfOS5x/csQnPGkcUEpp0BKLHekzpVmEfTZNjkVQPxzopk7UyrTuCKxsXqzSJ
         3DFcCFLC95nXyVH3bR4zwbmXKWW9QXK1DTZY4wdsHVba7szczXbIOqj7H00ZpQSLad9/
         ZZj6dBEKp8gPfqqbJi0IqkTgP+9Gq2UBRL1GYa/mIJH0pyKGVgWdGnKQV2XmDn6+iFeI
         hdEEz92tE+nEj/b2QHKFEeBLEuOynsuXSeMewrXPOHixqoHWlZvuF7dKzj5rXqICtw0l
         Zdrw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531LWVCfOnn6JafWj+2i1Fv/lbmrrx5zn2HDvqvvCKeSXBeVEAWF
	iTYMbPzpWtHeHlHM1oyTOJ8=
X-Google-Smtp-Source: ABdhPJxS4zmGDwcFjoag68LS8s2PCkD/LZtAvwC0VPlCIlY/3ERJUFreglTEScOMoI/RUDSm8ez4bg==
X-Received: by 2002:a5d:61c4:: with SMTP id q4mr2375038wrv.179.1604663233035;
        Fri, 06 Nov 2020 03:47:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4e19:: with SMTP id g25ls576377wmh.2.gmail; Fri, 06 Nov
 2020 03:47:11 -0800 (PST)
X-Received: by 2002:a1c:20d0:: with SMTP id g199mr2191485wmg.68.1604663231652;
        Fri, 06 Nov 2020 03:47:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604663231; cv=none;
        d=google.com; s=arc-20160816;
        b=IOwWaHVxlepkuC+Yy8QSpUwe6SLOGF2ESp0r766vHPUZkUhDqpBPyaIiuivJTMe9MA
         ZbMVZ8ORUnzEy0hekhj8VW9LCKSfMiqyQCRfaJ1reHS0DfPSB5EdfprSVIjX7RLASp9f
         9x1OXkxJUKtoyso511kTkW/Oy/XkF+TpduwrojOPaZE2CDeNlc+JqyoAVtaf79FIXoHv
         ro3EKUN9LLkIvYZwgBoTY1xkCtKeSVN8+8zxvcqLqxv3AbvTJuPAdmIJYNmLru3n7wMM
         nrnhCtL7IzmVGELXdY76i/xf4Jhwzr81i0TOTN5MTbvDvjtiYaRoMLwj/c6ibDGNOkmh
         oW6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=OXagr4DmYPex1JRSKVvMR6QgTpeMGqEIJW6Y8TvB4IM=;
        b=tcmmZr4FjQBoZI07Ioa8EU6UJx1Nq7MRMBgcWLI864XW9X1WFcdnXfdGUi+1EO19QE
         5h4V9w9O7sMd79sGirCO6fEyZSzzN4yIPih/AdgZBDcrxi0MU4KqBu5svuxWhhSXzs8Q
         jLso91ZKLNMt4yqUE0NL0ojMNznbPbDo1ZuyTgwna1O8OgX/fXr97busObiCbWURInUq
         7kQbkgNMKXgFmvWqWf8Jjq3j+Mgq6EfZmaxe0cymgJL/xNMdAPEksbdllRNK6GMbDJSh
         UXUln5AhdBMvXk8kH4dOnTof5eiy0smyeu1NSt8C/nGuvkCc+kQhvP7yp/P3pWGMklBm
         s+aQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id m5si40136wmc.0.2020.11.06.03.47.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2020 03:47:11 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0A6BlACl003514
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Nov 2020 12:47:11 +0100
Received: from [167.87.41.231] ([167.87.41.231])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0A6Bl94W031916;
	Fri, 6 Nov 2020 12:47:10 +0100
Subject: Re: [J7] jailhouse hypervisor in TI J7
To: Nikhil Devshatwar <nikhil.nd@ti.com>,
        "Liang Jingyan (M)" <jingyan.liang@marelli.com>
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        "Xiao Jianhao (M)" <jianhao.xiao@marelli.com>,
        "GAO Zhao (M)" <Zhao.Gao@marelli.com>,
        "THOMAS Deuilhe (M)" <deuilhe.thomas@marelli.com>
References: <e2ab7c14fd244457a1faeb99ff0fe5be@MXPO1FGAW.fgremc.it>
 <20201106102901.i4qk35q4g6eqglhu@NiksLab>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <484b82e2-8f05-485e-49e0-4e0ddbab989b@siemens.com>
Date: Fri, 6 Nov 2020 12:47:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201106102901.i4qk35q4g6eqglhu@NiksLab>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 06.11.20 11:29, 'Nikhil Devshatwar' via Jailhouse wrote:
> On 06:30-20201106, Liang Jingyan (M) wrote:
>>
>> 14.   What the hypervisor have got Safety certification level?
>>
>> if no safety certification, pls share some introduce how does it make sa=
fety?
>>
>>
>=20
> I think the smaller code base, deterministic resource allocation and
> other decisions are taken considering the usage of this hypervisor in
> safety critical systems. This shoud ease in certification.
>=20
> However, there is no certification done for Jailhouse
>=20

...and that is because of the lack of a suitable hardware platform - up
to now - which provides the necessary safety properties in order to use
the hypervisor as a safety element.

Certifying the Jailhouse code base itself would be doable with
reasonable effort (we actually discussed that with a certification
authority, T=C3=9CV, already). However, that alone would not help you if yo=
u
cannot map it on some real hardware. Check, e.g, if you can get a safety
manual that covers the A-core MMU so that Jailhouse can rely on it
(and/or check it during runtime) for establishing spatial partitioning.
You can also watch [1] on that, namely the discussion at the end of my
talk. It's old but - to my best knowledge - still valid in this regard,
unfortunately.

A good share of these issues we are currently trying to address via
hardware/software co-design in a research project [2].

Jan

[1] https://connect.linaro.org/resources/hkg18/hkg18-115/
[2] https://www.selene-project.eu/

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/484b82e2-8f05-485e-49e0-4e0ddbab989b%40siemens.com.
