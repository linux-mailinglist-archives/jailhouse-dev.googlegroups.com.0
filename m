Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2FKY77AKGQEQFXJF7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3a.google.com (mail-qv1-xf3a.google.com [IPv6:2607:f8b0:4864:20::f3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF3E2D54F5
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Dec 2020 08:59:37 +0100 (CET)
Received: by mail-qv1-xf3a.google.com with SMTP id c2sf3232883qvs.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 09 Dec 2020 23:59:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607587176; cv=pass;
        d=google.com; s=arc-20160816;
        b=YfgCrT13EFyKRM4qEyr4P9+hhWIqaTAHscorDEMc0u74VbP4/WH55EDRUe8T4gNeSg
         zwjNnDx3a99PoKz3i3iEi/2f3QGEB9bUDvMTJ26GhDbG6wJ2EeNMpGwjBygg03nmkVZ5
         s+dJpaBS4gIGwprGbZUwOsNkTDHUdOiD1edQKnuSDIgfXpx5E4zaUlOBeYy/u3pDanMT
         7fN/IK374nN+11uHkLzWJHuNMNdnU6seSLAWeAPqTZbYsmF/6BLC6gkB1QleAoZyx3Aq
         1EXTVLJglQVJRSNvlxA7x8cdRQyCR2TyAdGa7KLcc7us+0rS8FB/KIaI/rJ6hIowQ9fF
         /QLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=eJ0FLcnPj/zn+eOZL6a4FoOSNuZZUbZj6SEn42AC0hY=;
        b=QemRsgyifWhoRINW1vg/TZigYgiErOzoZJeR1UAI0hq/WvNeIY7iSu6EmGekigJdSP
         PR+mRzQGvSRZenPnQDYK5Kfwsd1cetfMXZLEZzRCZ1TkGP4qB5rhI19YK6vvESmqFHQP
         T7Qm09CMGMhrBlYfHuscX7KExAXDJKg9hXua++G4w5t7rR2quabAC4FjHs6w01AhVKrR
         UR1kbJkReeB3g684OSLlTbAidutrSVn0S4T6ReHVT6xob6Bcnxy8vwBeiIGQEGmCvJD3
         UUSK9ksAuWHckNVb1rNu2L6QGVGWhqnBVEC5uYHagvUnHFmQEAurrrdVQVkYyQ3gjpz8
         qBow==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=eJ0FLcnPj/zn+eOZL6a4FoOSNuZZUbZj6SEn42AC0hY=;
        b=NSUGBsdMOJI5EZmlO2fzA8EpXKBBuz2LQA6wdMI/c0sAi0osCNgoTR/xIXuKJvw35t
         4jbZBPZOqECER5kwPuAroab98SlJVZ950nAZdBKOb0iRAs+66rsaW8SOLzCuMzrpMAP1
         T022V4bDyREYk13zyc7yCc8/VG6bTvEDJ9yxbu8Yq8Y4ZMiEdRMyynxsvdBRqbKUKa3e
         nc+2fHRaeFiw0yD4raxnMGBbnpaJfiIYpuV2fPx4nUH+pNnjPNrC8aTjaocqSjElgDWR
         tN8SnIdA4atLOzl1tlQ31SkEzpE5S5hQdpJsDHUhYX63qkbLh/Yzgzvk4xHQMD9yWErz
         PV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=eJ0FLcnPj/zn+eOZL6a4FoOSNuZZUbZj6SEn42AC0hY=;
        b=rx3jn27q62AzE3D9PPzR3Xa/sPw8Qoe4p8JKtdZDtosFDxSDl8h/tZYq91/jB7LzyV
         8TsaQtk4hBDvohzhktywfRzvOqzxdtXA8wX8PDmoEd3pAysRz38SKZqU3jDBrQ/9vv9k
         AMW+u3uiA0AbcKyYtHjpZiZ8FK9u1qaBYxXw/Im9EWLtEEjjysYdyywDepJrzf/yvYdd
         tIsk5oeVGI5V5tlKKXA0YllgLg62ujQVjgEswE0tRMaKVIkA9hJWpF+uFlwvA2WAO5p4
         tzfF66CeHPYFVXqYjeb1Q4DpgTQZ0f53eGhgkwX/bEJ4VGI5JMI6QoJS0/CfBdsrUkb1
         pzdQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533MYnAbj2wp9jvTtSW0C0aRTFnvbOrt4cFOk5rffhzqFvTHpa1N
	z712b+YlJ46F313SWFoZs/I=
X-Google-Smtp-Source: ABdhPJyYcHs2ge92gruf+P1ulZdpOGAbrLiaKVT3saohGfmfuxgUJTAYNhUus1oPMuOB5SVI7jejug==
X-Received: by 2002:a05:620a:2104:: with SMTP id l4mr7428526qkl.35.1607587176528;
        Wed, 09 Dec 2020 23:59:36 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:572:: with SMTP id p18ls2120282qkp.0.gmail; Wed, 09
 Dec 2020 23:59:36 -0800 (PST)
X-Received: by 2002:a37:8681:: with SMTP id i123mr7318516qkd.54.1607587176024;
        Wed, 09 Dec 2020 23:59:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607587176; cv=none;
        d=google.com; s=arc-20160816;
        b=JgaTWiqdywIOzDhy1DytN3FiGPHZpE60y2YZItiOd8JtN6DbtNbhx51bcHXux9BbkX
         TqQYFW7U8/IDpGbgt2wiRSPbw9Fjbn2iLNBRQhK1SwaPrLFGNJP1M1LXh6KcpEgVPbhs
         XS/gx9Z1Qtfim8AlY88LF6yyr6Wtosbexy2+fODuJI5ADT2+IQM+gm61i7VJ7NUV09ob
         3m50u363CoAwrfecgWh1oZyxcOhVmufvhh3RqmGvG0ZOfXCN8+pwovR1PlpqJHH1TZE6
         JW0Ee/eNCvO3+5K4PHrLI6NohI0r+ePtQfvaeh9B9Ekwfx/g8nT7IT+Vw6PKvuLHTb7B
         i+vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=g9H2CCGRdNmNkScpXN8HGiI/r2VBI6TnV+fOVeWgjYc=;
        b=h3CZSyitZm5dJFUCqEjHt/x1JaTY/OqIYGepTFk/vNDz8n7lHDFlCddNvrloOH71Tk
         cUo6jpurGVb53i6loYIm2tUmHaqGLr+TPlt2Dlc6r1skYIV2eQ3vSHwMiF/iD4LulBzh
         z6PEzTp4URWyUSVGGqLtY3WL9IPx1bJiHvvjNvWXOfZju3SN+nYk2MUY8Mh5p8BedSi9
         nFYZyq+wQHYac2XuTi41nJ3vTCSKrM6I2mOM6WPXOwdQkP9H7lO3Di3H7lmXykKyKzTn
         w619mMtD36UonTqzexk49lHGo86BqFNkZSViJcFUK1cxpzgDTejge8fHxUO4PbPJb8bP
         UnMg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id x8si339603qtm.3.2020.12.09.23.59.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Dec 2020 23:59:35 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 0BA7xYiO019068
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Dec 2020 08:59:34 +0100
Received: from [167.87.36.107] ([167.87.36.107])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0BA7xXJ7000431;
	Thu, 10 Dec 2020 08:59:34 +0100
Subject: Re: jailhouse hardware check error
To: Sainz Markel <Msainz@ikerlan.es>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <PA4PR03MB718419E2B512BC70CB7A56C1B6CC0@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <92106761-1676-12d6-4d79-c1d9096e06d1@siemens.com>
 <PA4PR03MB7184C97813C5A21C345964DDB6CB0@PA4PR03MB7184.eurprd03.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b22f7da0-f319-e073-8e3e-9a0c3994764c@siemens.com>
Date: Thu, 10 Dec 2020 08:59:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <PA4PR03MB7184C97813C5A21C345964DDB6CB0@PA4PR03MB7184.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
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

On 10.12.20 08:01, Sainz Markel wrote:
>> Are you starting Linux with "intel_iommu=off"? Don't do that for running the hardware check, only when running Jailhouse later on.
> 
>> Jan
> 
> After removing the parameter, the error is the same...
> 

Then your BIOS has VT-d disabled or your board does not support it.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b22f7da0-f319-e073-8e3e-9a0c3994764c%40siemens.com.
