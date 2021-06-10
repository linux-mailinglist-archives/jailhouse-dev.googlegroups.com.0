Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBR7CQ6DAMGQEQMV76WQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4663A29B8
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 13:02:32 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id z13-20020adfec8d0000b0290114cc6b21c4sf696702wrn.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 04:02:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623322951; cv=pass;
        d=google.com; s=arc-20160816;
        b=puB4k+/yBR1mEfLemga5DxCdvM+euYTcXNiv982zB+Tyh5uxY0w1VNgZkVpca/6Yrz
         qV8lZM85QoXA4Y8xTceHUXfLHZxtiPFmFeuWvfQ4ceJDp7F6/SvDfDwpFN37Gc6uSx6L
         GQ77ecA+gm2Y6+bUTzil3HWgaHZsnIyNjaBX285C13lhf+cyK+B5B9bKJfJjrCHpUpkk
         YYtjtQCHEmjQTaVEg6/EPNMrriUFsh3+8OH59ySM4uFvPIpTRlSon8f1zT/b0U4c93gI
         AS60bE9N1GfMO58H9AfQ30Lx9QLMqKM4ogPC8Yv/Tzo0XEgFy8hnk4ftGlkGsomvylKX
         L2QQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=r9oEp3/q+lwCdpHJ3cLBPLS6nXWpyXQuWG85gN/1jfw=;
        b=WY7Wprrmx0Zmy8mAG0oXOgmAN+Anjd//CJYOzHLVG3UtGJOV7+pkRE27u4++EQXXSj
         Y6vglW7QCq3+9wxU9wZU6obpbR0RitcE2jnExXh1Tu0FrUXs/uIO5ReR4b95UraK6zq3
         iUKLYKWXABBLJ/jHVPFP3Jyk7VXjZm8jbVZ9CTuGxzEpN+pMSila3DsQNMv59yJbmW1s
         jS5TmQ5p7+UEb+Nn7BRnekE/PY9zuKsNnoOPK/m1L4KENbCYgIe5We8a4i+H9aCYWVIH
         uy6x5H8O4BZhjzGYHp02qQRZ4dqrsa4ZRNI2PYq8sHXlii64s0EAC3bmeerVzzELTMLz
         G2Gw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=r9oEp3/q+lwCdpHJ3cLBPLS6nXWpyXQuWG85gN/1jfw=;
        b=n4K0cVQLpxlG1Xe7Fp4s9sJjJ27cB9e1/+Ia0uK9TYgfQ8IP3mHF1EE1g3JN2eR4R7
         RQC16BuICY+tyj0i71Cs11eOf21+1mPJvyNW3jp1eWkGHnPLzK24h7M4q3IAMiV14H6V
         q4V7e7CN+oDtEKiHdz8IRWi+fRaZpVW3hahG60QPzWOptK4Av3GvIjx8hxpsYHF58dA5
         /T0LeqNTh0yzaWv6Lw6yWCrRNKFMzT3Nmtp2xwoumIGmUzNHRk/bYU+7JHER/nq+0yuu
         xv/K+wT3PzY0puPiTcISNTJ+RfOQysGAsrM7Uv5DsBStDX0bAJ9GgEc4BI4QGwQzqGWR
         ppjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=r9oEp3/q+lwCdpHJ3cLBPLS6nXWpyXQuWG85gN/1jfw=;
        b=MIFjud3e9c9n62deRZzxD3Slu9zt3fhFGH/IT9K7nu9NapfEVq4eExicT4g//c3iOg
         XPupbLk8sYVRt+wPq2eaJhP5nH7m51QYDtOlKp6EyVVAcTgOkFmQaN1JMvTfizR7tje5
         xJoeZxPjjaaZ5FZvQPeIZPyS9Gy5lfjokHQeUAjqg3fkCWJgi1lTqBBt6nwzu6OWvujM
         9/HZy111vohjnI8TfJTBt1pqmoxM9DS1sMkOHPg5GczkDmqd2ElAcPMMDyOSVvF492BE
         g5svoxDWAn736PaX6rvBqTti2HQgF37GOym6IrYcLMpbRVUiLAStP4GiitnzPFBKBeoJ
         uMCA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5309l0OlRvYxUpKmuOR+SVmJXfIwTdQDR0CIoMWYCkPAB6/In8hE
	o1RZqyBi9JbgI8bSDUJUbAw=
X-Google-Smtp-Source: ABdhPJyIhYW7toCt/ntsb9LAz+fwc2lG+28Pu0NFmmcU14bnR/wTZgd5DLnDoZbfJMFIkxvqMAGqzw==
X-Received: by 2002:a05:6000:110b:: with SMTP id z11mr4654945wrw.278.1623322951786;
        Thu, 10 Jun 2021 04:02:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ded0:: with SMTP id i16ls506303wrn.1.gmail; Thu, 10 Jun
 2021 04:02:30 -0700 (PDT)
X-Received: by 2002:adf:f98a:: with SMTP id f10mr4761078wrr.143.1623322950743;
        Thu, 10 Jun 2021 04:02:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623322950; cv=none;
        d=google.com; s=arc-20160816;
        b=elXlYOODN951aeLeo68D6w2MuPeywLX7vwGLCHUys058EaiaRwvkoI7veunmSIT77w
         7/pBI2I8t7D7RF3gUa1WHh3Gbi/I3jb5wvxOJ6wPn5AkADf/dLpc6HavB0gxYj2HYxK8
         xALufYdoYG2b0RUy13PZLHbk4hr2MB6vdmCFk/4XYTa6FKMdQVcq8WU/b/AHShh6+azZ
         rCM1AHwY8M5gwDlsNAYGLQgxcbI/mOAGi6S9u86OJiddunOT45Td/7v/wrWoQpUftUtO
         sCG2CMT6rxXJg2pTHQkUzM382zHn698uwmlZW2bU2W4mFdRAU8gpDaHWPGuPQvPodm44
         CVow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=lEPBl5voyoRLqH+3WBkldHdKSFMiKpJIsZq/DyCrDlY=;
        b=di/R3PaquCb8ImTQeaPlyxbrHpNoXJJOnfsxEG0v2j8CNFD6OV2B/TvR6DW5i+F5Zz
         EWKmheHBXpHj++a1uXchbrP7B62f4Z0q8sEyQi+aug1vphwXqENOt/PiIq8dTEHvC6OO
         0HQqgobdUc7pl7vYx1Mh8piIEHwYEsepCq9gPWZaaaFLQGeM7N2okdqiPLwIT7XyAbBF
         TbaRTbsUCVx1nfsG9erKzU5djlvbvVstwbdbUuK7Tt4cIoo6z2V63Cq12YdGoGap7czL
         zXEsGqXInDVimuryaZtcT7qOt3qWQPx6sDUo6HPTbT1ydTdXp5rZixhGlgeGg7KtPrcF
         eAGA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id z70si198987wmc.0.2021.06.10.04.02.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Jun 2021 04:02:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 15AB2TWf014494
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Jun 2021 13:02:30 +0200
Received: from [167.87.77.77] ([167.87.77.77])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 15AB2Tqe008824;
	Thu, 10 Jun 2021 13:02:29 +0200
Subject: Re: Understanding Jailhouse partitionning on persistent memory
To: Stefano Gurrieri <gurrieristefano@gmail.com>
Cc: laurent gauty <lgauty@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <d56ce2d8-9299-47e2-80b6-eea428b62f70n@googlegroups.com>
 <0d8757b9-c2f7-266f-8ded-709c632f955d@siemens.com>
 <CAKpvFF10mGXWcmgj+=Qy4ypi39cB-wQdtLVzn6OwppOtuLms7g@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <ed4dfa8b-8580-b6d5-e7d0-60e68d602873@siemens.com>
Date: Thu, 10 Jun 2021 13:02:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAKpvFF10mGXWcmgj+=Qy4ypi39cB-wQdtLVzn6OwppOtuLms7g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
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

On 10.06.21 11:51, Stefano Gurrieri wrote:
> Hi Jan,
> 
> so if I wanted to start a second Linux inmate cell and mount a rootFS
> installed on the second partition of my eMMC (/dev/mmcblk2p2) is it
> feasible or not? It's not still much clear...sorry.
> What do you mean /"In that case, you need one cell taking ownership of
> the controller, *serving other cells as proxy*."/?
> 

Jailhouse itself does not virtualize common devices (like storage
controllers) as full-featured hypervisors do. Thus, you need to put the
hardware driver for a particular device into one cell (e.g. using Linux,
but could be other OS-stacks as well) and have a service there that
exposes said /dev/mmcblk2p2 as virtual block device to another cell
(trivial example is [1]). Obviously, this creates a certain dependency
of the cell using this service on that "driver" cell providing it.

Jan

[1]
http://git.kiszka.org/?p=linux.git;a=blob;f=tools/virtio/virtio-ivshmem-block.c;h=c97aa5076a6d22ccd01862f3e4db0e12641825c3;hb=refs/heads/queues/jailhouse


> Kind Regards.
> Stefano
> 
> Il giorno gio 10 giu 2021 alle ore 10:53 Jan Kiszka
> <jan.kiszka@siemens.com <mailto:jan.kiszka@siemens.com>> ha scritto:
> 
>     On 10.06.21 09:47, laurent gauty wrote:
>     > Hi,
>     >
>     > I'm currently playing with a NXP dev board based on iMX8Mplus. I'm
>     very
>     > interested by the approach you have developed in the jailhouse project
>     > in order to segregate different cells running different systems.
>     > But as i tried to install jailhouse and played with cells, i reached a
>     > point where i don't understand how jailhouse in intend to behave on
>     > persistent memory (i.e. eMMC / SD).
>     >
>     > The current configuration is to have several cells using the same SD
>     > card / eMMC, but relying on different partitions. And i think that
>     most
>     > of the projects in embedded world will have to deal with only one
>     memory
>     > device (SD, eMMC) for cost and space reasons.
>     >
>     > So here is my question:
>     > is there a way in jailhouse to isolate the persistent memory (for
>     > example partition) of each cells from each others ?
>     > If not existing today, do you plan for this kind of features in
>     the future ?
>     >
> 
>     The general issue with partitioning of storage is the partitioning of
>     the device access methods to it. With something like AHCI, NVMe or MMC,
>     you have to go through a central point, the controller, in order to talk
>     to different partitions of the same medium. In that case, you need one
>     cell taking ownership of the controller, serving other cells as proxy.
>     That would be the Jailhouse model of it: no device driver in the
>     hypervisor, rather using a cell as driver. To provide virtual access on
>     the physical storage, something like virtio-over-shmem + virtio-block
>     could be a pattern (though not yet production-grade). Or storage over
>     (virtual) network.
> 
>     An alternative to the proxy cell could be if you have a directly
>     memory-mappable storage that does not require coordinated access on a
>     central controller. Or if you had something like SR-IOV capable storage
>     controllers that could present themselves as multiple, thus
>     hardware-partitionable, devices to the host. None of both we've seen or
>     tried so far.
> 
>     HTH,
>     Jan
> 
>     -- 
>     Siemens AG, T RDA IOT
>     Corporate Competence Center Embedded Linux
> 
>     -- 
>     You received this message because you are subscribed to the Google
>     Groups "Jailhouse" group.
>     To unsubscribe from this group and stop receiving emails from it,
>     send an email to jailhouse-dev+unsubscribe@googlegroups.com
>     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>.
>     To view this discussion on the web visit
>     https://groups.google.com/d/msgid/jailhouse-dev/0d8757b9-c2f7-266f-8ded-709c632f955d%40siemens.com
>     <https://groups.google.com/d/msgid/jailhouse-dev/0d8757b9-c2f7-266f-8ded-709c632f955d%40siemens.com>.
> 

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ed4dfa8b-8580-b6d5-e7d0-60e68d602873%40siemens.com.
