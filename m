Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB57X4CDQMGQEYPFDLGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7983D123B
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Jul 2021 17:23:35 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id n6-20020aa7c4460000b02903a12bbba1ebsf1202219edr.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Jul 2021 08:23:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1626881015; cv=pass;
        d=google.com; s=arc-20160816;
        b=QjXl/9sdBxNcjP7E524QfdQyFRZEOoBYTyqZKCQnLbVonAmnuLSrJIMrhGxIoX8oKW
         Tn+akyfOvpkBAZiexANMUsQauhv3DhR+XqMpWJNitavSVwtcLLh7ZnPbubxftfHX/n8z
         KhyMLtntzrcupVkWzi647L6jc44bMKsycEDnixSZB0LgwG1MyAlZscQ7UOth79yyQ+Bh
         zLfI1hWwmCcHf3EpUX5L5Eecg1pwcQ/qdlUrm6DfTZNvijGYAK2a4+Aok1t0KJFPYad6
         vkijVFi0IhybOFnn77KHi4nNEzSZVwTH/2MPS2ZTPEBaxT1P5v8bK3u28qtU+FVQ72QY
         gNhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=pvltl8RdDKc2BTzbQoDiM/L0rLhROp6/c+rs6il9AP4=;
        b=zASULOEgyZJdkQGRFhVRRlcf+2bWWdmavVRRzGXoEIuub3hnB4O2uIC67LgqLrM14f
         6gv1Gs46agNh/lCyBMP9TCJCBAq1TBXUzlJI24CQ7M+INt7xXltnd2gpgJJL4Mqv3yPT
         SyWNPCgnNtpsnTlKHCPfjtql2idzCWfCC4qryscUWzzHSmY7z4Kb59c5wGOgGxXlftm1
         oxu9c+d7E/VD9ZEJXfH3YpGuDDZklPEqaSItXOcZVOEoaNSk86aZ2iSYZir48qV/vIIa
         tbNaxHOz0NK6jerOpzLSdsLXxWzx1vw7tW0tCSjiEf019HrZra8hiwWU0bEOnZ9mnnI1
         fbWg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pvltl8RdDKc2BTzbQoDiM/L0rLhROp6/c+rs6il9AP4=;
        b=OHzc6Py6GpShj1D8oC0RJOuXQHymwfnQpy0GwITCVR7IMYdUeymGFMjKgR0+wAGAlR
         XeHteIeNnHyB+isGMX/X54psU69vFmVOCEU/0v24mpgw3JOlbut7vBMfR9Wpxmi+PG2a
         u+RjnxBkkZLEctJ4yAq7RrheUXEVjZrzzL5hrZMfeV/nD8hw2opC58YGqDr7i2u2uKd1
         Njtn3rB4nTbhEgvGY9ANLDMLaY2pJD7VGD32S1CaYPqjw0nMDL/vpOuzJr4P21JWpbzk
         OjPqZwumKR18itMj/AhyxYyuA3o4D7QrG0HWdTAE7/FsLFQGcoN+WxmYKeetWmY3WkmT
         OvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pvltl8RdDKc2BTzbQoDiM/L0rLhROp6/c+rs6il9AP4=;
        b=N5C+jTXEOULPchgIUPfXzq/WO8RaQx2YYoYkoVdqvnfP3t6aaHPAv4y9dzdCtYAa0b
         Rxq55HxKtWM+xCZ96Dv+fa9HJS/EzPFCs1VqqNVL1mF06esivEsAETpCylM3ovAYUXzu
         hmT46dr7GUwUIFrAx7b5XypJv0tzgmPRNWjjTgUkZFGofLMbJmo+GNGYlbA6wqeP52cW
         uLiKYRfxXKUJqziCQWwTkL8T0X8ynAGDj9nux9ozFZ98DQuZzvWevJfy5lTQrV6EkUCd
         KK2NACxgN0kLljaf2YUzy/Gio3vthrubN0nsFLTKtmH62aA5plR4F1PhYxeWESZM47SL
         qFHg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Azd6vVpwXPjAta/kKASZkZ2J/IBWbyTOtIGQOJzEoGdglhnES
	YHOF/nkaJXKfSrtpdtjhLYk=
X-Google-Smtp-Source: ABdhPJweXywcDG0BlNU6opua2yqycGMQtYZIDOOm1gS3vqKqpb57HGYcbDOpNDIdO/Rx07pEkNhrig==
X-Received: by 2002:a17:906:5e4c:: with SMTP id b12mr33093601eju.230.1626881015361;
        Wed, 21 Jul 2021 08:23:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:fb92:: with SMTP id e18ls3192289edq.1.gmail; Wed, 21 Jul
 2021 08:23:34 -0700 (PDT)
X-Received: by 2002:aa7:c58e:: with SMTP id g14mr50081978edq.210.1626881014337;
        Wed, 21 Jul 2021 08:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626881014; cv=none;
        d=google.com; s=arc-20160816;
        b=F8tRUtye7einFh4FnMzmuTBPEym+pfnxxKQ5Js/SioAqNdSj5gXMy0cRujqNxFCaBb
         TCQwYMGmUniN7ZmEEiI5RasUCQWMq/2HrVO6aumT2K+byY9fq8evFM/xyNEfxlOEHtQY
         srSLVPQrFi/KG5MzmgNPOHlAS/E8dPQ1meHt/aJL3GAAURh8xTmeAXPrFoO2QOYiMTw0
         l4QG5zggl3uuUxokxCOY8BEnBU1zWBIp40XxzCJMLXv7lTnMw4mN1/XrxubiqsGW9qix
         XV67sLpH75q2KaRFqemr4jMlN0eKHr7238t7sRDtGjIcMZ2k58DdkhOwHf8qtMYo+kJg
         qnTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=FrmPKmqkEL9blqwHcCSkRmofspZ3naxK8hOeVnu6e8o=;
        b=AyR4yStSL+PayAnH4+GGP9JkyGmg0x8LUmLnDybgvvp9esJzU/QQIS46O7qsGScsqC
         owpu2SU3D+zYstu4THdy09muTPfFXVtoru3oYfuJ6eVUi5fQbSZtXdXFTbA/m6BD9aQC
         lHLutrswPACBjtEhobuGF182ijKRwbd+FvhH0zCsxwjW3cIxYdBabxIhriCllLJ7ut9d
         oc8+IG848qhfCNnxauQnykzZy8cMUQLZUq2ug3TEO2bjMfTXRQOYHQPv068MdnFjQQIr
         f2jgKeFL+o9BsTf15t7qDKneTAw+rC4goTidqr3xCcv1nt9uj8nmJvuzXs8U2Xu6GOmS
         3qHw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id h22si1129422edr.2.2021.07.21.08.23.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Jul 2021 08:23:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 16LFNXuF023709
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jul 2021 17:23:33 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 16LFNXwi012291;
	Wed, 21 Jul 2021 17:23:33 +0200
Subject: Re: Recommend some books to help understanding the implementation of
 jailhouse
To: along li <v6543210@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <274afb08-1ed4-440e-b41b-6ca12a2ebe62n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d404edb4-daac-a260-9234-8685f33f6627@siemens.com>
Date: Wed, 21 Jul 2021 17:23:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <274afb08-1ed4-440e-b41b-6ca12a2ebe62n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 24.06.21 09:28, along li wrote:
> hello community!
> Are there some books or articles can help=C2=A0 understanding the
> implementation of jailhouse ?
> Easy to read for beginers.

There is one in-tree (Documentation/articles/), though it's aging by
now. There were plenty of presentations and a tutorial in the past if
search the Internet and this list for references.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d404edb4-daac-a260-9234-8685f33f6627%40siemens.com.
