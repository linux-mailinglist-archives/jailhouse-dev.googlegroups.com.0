Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZMNTD7AKGQEMS5CPUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 7411F2C9AB8
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Dec 2020 10:03:34 +0100 (CET)
Received: by mail-lf1-x13c.google.com with SMTP id e16sf674102lfd.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Dec 2020 01:03:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606813414; cv=pass;
        d=google.com; s=arc-20160816;
        b=zSjEnvDNURW4R6NPb+FzfG3/bcpr+96D++GKp7CPc48lEVye1DwT5xkgvPJs9OUyPU
         CI2U+I18TVDuvn/+jfoSMGEPV+9NbHZy8QqmISV7pexEAC7ooBdsFN9NX8dHoyjhA0C6
         vZCQBcrL3ZnobjyPWHmsv/OxVcg6IbiCqsByHb5ZQvxqumwe03b1I5/CD31S5ykl9Z8M
         WGVN7ZBZkuBMzleCyy7GCbwDf9UG9Iv6qL9Ubt7LSsDUnu551MDN29H3HaP5f7fyKhxE
         tk90k8Xj6OK29hA2JFCIHPRfaAIQFoJyGFVhGi9+xuG4Wz+ED8uTVh7Fy/PG68MOrq0n
         mcBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=CH7YGxn6FVgjS0L/KL2ksg6CPVYzF6ZnOaCMa/Bga9s=;
        b=GvSqSxhKbQ6G2MNPnCaXtarAeo4hfjya7rIh4bwCHLNWndYOqpCA7SnOfxus+nQ0FZ
         eLhXg56VsIosWZVmLsQV20KQ5dECJBp8dnTLCRMZLb9/KLr9UyT1W5ugYCe8eGYHS5Sz
         XLC4YxjgHjUR1zztna26y2EEcpqMb/jn2j3dtQF4LhezaOVfiRAHGFxwskQa13TxzCsM
         xBixxiEFDWA3+L9fhbgEDWhVosI0y7rCs9Y2YLp63MQxRbM+1KRjZgW7Ngp2uUsXTCQe
         wViIAdMa7hSNhsqbLdwvNxPVVheHmNAPe5XJiDvz9VaTJcWxB/uzh/ur4goP+SA+S4/Q
         JpCA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CH7YGxn6FVgjS0L/KL2ksg6CPVYzF6ZnOaCMa/Bga9s=;
        b=o4awP+zBvSQQcLUE3008BjdOsT5Qzo+7kBfNju5ca+6onfqUwlz/rChG8701OZjRLi
         mGn0SKKBix/qCDH5aLRhIFs522RRfZatsqDat1Y3TgPyYPnCBPRRtICBZzaj0TUXTc4v
         k/7wqOvLDFg6zMuQCjaPedrrfr6UL0FZZ0nd17gtltZZ02UZgOeMmXxslsVYc8pDNayY
         OR+YAbi8lgbY44S1X+nf3LAT+D2yfciNTwn4f1e8Ji7NcJheR2DSkOZ3MJlbwoSoWUPf
         KaaRAkC3LpKvOsG57XXBN1dwXVbDzfDfBixjkIAtJw7WkHLRC9Q57mwN2GjlupoF+W60
         7cfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=CH7YGxn6FVgjS0L/KL2ksg6CPVYzF6ZnOaCMa/Bga9s=;
        b=aa26oc5JSqTrSz8sY+WIjar/ic7Z8dK3mF8FkCnTisxTNeCcliZlEbsDtxd8uwYhsa
         7W+kYvaFCWmQvzvuN+PTwufSGyCO1wB9SSpeid/cS+Ngub3s+4KIy2TIC9dvQhhwKVUR
         0/g+VPO6zCig3m6lmrmMIQ9svpGn6FmsXuDzlJ6ynf0baqJB9s8gCSioWxfHyvgSpPCI
         LjB+vsoir4/vX+/PmkbbLkQ2TLoSunbNyOEtPGnHCwuM1I0q73qKxU+brLIy/bsFfk0z
         k8QU/q1y47Wwa6Ya2LIctBn1pPWAQNvnYmA8CG3wLQJNOQ30PwLVIpXa7huRax10v/IL
         +KkA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5322eM6j52pboQCuTA8Gzb84bE9DcZwDuanAvWXUw0WWox78nVFA
	2g0531NcE1+Me34BpkqG3J4=
X-Google-Smtp-Source: ABdhPJwU3QlG1os581eShqnDhUtigUBabat0i8A1D0pMeDfLgw2fpJ4eFecTIKpaz0A5aeTxe4zv+A==
X-Received: by 2002:a2e:90c1:: with SMTP id o1mr767995ljg.130.1606813413969;
        Tue, 01 Dec 2020 01:03:33 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9908:: with SMTP id v8ls206631lji.1.gmail; Tue, 01 Dec
 2020 01:03:32 -0800 (PST)
X-Received: by 2002:a2e:99d7:: with SMTP id l23mr816375ljj.303.1606813412698;
        Tue, 01 Dec 2020 01:03:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606813412; cv=none;
        d=google.com; s=arc-20160816;
        b=IYVgDqSqH9JxcHwjVC65v8pmnbtfB47XCL0Z0lHjffr5CvuzpP8Ls5+y9HzqQQ376J
         CANa+gca1aYOYWDVsHwIYdGVpky4vXnUkbDObIAUdMn8Wn67pYiL3Q6bpGqnk1FmjIAW
         pSp4kWEU4NL9vIZoHoykVnE4BVgwNBW7sf5S04QWLle5MOOZ2Y83k3okbX942okA9fTd
         jcqOZ7ukdR6Om7jxpGj/7uHuKAP7mQB32hjk3U+yGOk04jsk4lnmgkFKpgheaI4i7hU5
         h7Nk2VWgGkXHxqOdugg/T/M9paU0CPHi1EgaQynqRPLeAZHBWVWG2i1kFlUWjDm31siV
         dNQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=p39pNvI+CUuvKV20j3Z77UpLZWhXUSgJpwAuXVLIAtE=;
        b=egGXUCVUFq6rirc0bldss4h5QsPZ/x7n385L5eSUVjyk6zHjccBaWEamrFlsqUdGER
         7bzEAl1xaNWkXx4YlrGRGO9AQZYVuTWFUUGRx674/1ZPGX6K7UpOuVLboKhEHDXThWYn
         J1nkCqjHs9w6xpJcD1gLNd4pcFMfVeSsL5HKfPH1zqC7hrCsYwyq8KSu3yPbWDFhkDU8
         PUdrElc3XpCd24a7pGbyRB7X/ZNW0XWkNN92Hz0tYCnSNd8+Ttt4Qgdj1WiFnDmTL3AU
         J4Jq0sYHgZwWQB0/vbH1tpvqrPFtxZnw+zpmpMAZXBiz84p6Mc9PuLUVzZfmfHKfVm9z
         DjfA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id q189si37597ljb.1.2020.12.01.01.03.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Dec 2020 01:03:32 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0B193V1e027896
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Dec 2020 10:03:31 +0100
Received: from [167.87.39.132] ([167.87.39.132])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0B193VOa011653;
	Tue, 1 Dec 2020 10:03:31 +0100
Subject: Re: JAILHOUSE_ENABLE: Input/output error
To: Sainz Markel <Msainz@ikerlan.es>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <PA4PR03MB71848B9D591CE51C322E5F9DB6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e4361d78-779d-dcfa-da6e-fcb8ba4476c9@siemens.com>
Date: Tue, 1 Dec 2020 10:03:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <PA4PR03MB71848B9D591CE51C322E5F9DB6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 01.12.20 08:48, Sainz Markel wrote:
> Hi there,
> 
> After being able to resolve the cmdline issue, the following error comes
> up when trying to enable the cell:
> 
> ~/jailhouse/configs/x86 # jailhouse enable sysconfig.cell
> 
> Initializing Jailhouse hypervisor v0.12 (197-g2f52a11d) on CPU 5
> Code location: 0xfffffffff0000050
> Using x2APIC
> JAILHOUSE_ENABLE: Input/output error
> 

Did your target pass "jailhouse hardware check"? If so, enable
CONFIG_TRACE_ERROR (see Documentation/hypervisor-configuration.md) to
get the origin of this.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e4361d78-779d-dcfa-da6e-fcb8ba4476c9%40siemens.com.
