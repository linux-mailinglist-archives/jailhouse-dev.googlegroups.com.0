Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBDO2XT2AKGQEC7T3KOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8091A3571
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 Apr 2020 16:11:25 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id c129sf507269wme.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 Apr 2020 07:11:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586441485; cv=pass;
        d=google.com; s=arc-20160816;
        b=LzMeAwRAMzFMmZbaAW/cIJxs1x7ywXfuG+y01WCJghpFrUTx+T9pmAmFuDUwYajSce
         e6PNbOWUCN2uiG+PCrldZ0AAL2hISrjaWfzPYCt+jrLTzKKpXjirqk/5fimfwypkfslp
         78+x5etoYeWOAiv77EbBMoapinIjvBDELVOuP3J7wKOKB3XqP+dKtcPsD3nQisolSdVa
         TSmGonmDQ9rJI6TEWO3j6kKYXs+6KcHOlWUEQqb2T3opDKUNh3qrt924SuvTM3fYnmDT
         npnCEiI/7x2jjGmcyWWz6iTt8gZc8IQafkewhvC6SLRLSt0RT36K/nfT4XZk9co0T3XY
         efHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=KCpKTl6XvGj44CPmUuCqmPsUrQ6O6fqS24UeHkl/clo=;
        b=eXt+ec1ix39KXOwl3BgHlIusd5IvbNsEippwnVTJRKKXpM6iWpv6sFA4R3mssGpNk1
         MaSf2v4KFaJnZXnkd4vsicdKtHAr21Cn+fSV1TP7UIDZ2kK6Py1GISuIwZRZn8AwiXWb
         0q0gj0rMQXh09Dxh2MHqUP63bcR8jCzimeqAEkyzPa9hoXDMVQTNw9hUwlwmoyysj28s
         zMjD1gL/GRT2799wxGCMtNWoM0eIu6DWH0DDJ9BXswOYKossqcArDOBIW4hX7gQ6f0jR
         LL099KCmnyH02Arl3+SfVAYqYCSwxP+4NpZe7yr7MOd5O142Q3Q44yiCZQIdw4qE0uBm
         IYTw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KCpKTl6XvGj44CPmUuCqmPsUrQ6O6fqS24UeHkl/clo=;
        b=nAPAbCkvlnNAa4QV9fxCQKFary6B6VKo7zcOgos+z8nbAsLCtyGP0kiIrBxF/OS1ZA
         PaUzI3JR668xLA6WNNBcxGuEw8NxQPMzokYSLNvJP1j375ShyE2I5foUpHZM3r65ESSb
         Dj0j3jKLDTYkV+bO2yLorEabosjOp+DyP+fUSb3Hi1OZmw259toqCsKlc2JSyucJYZPC
         sMcZE/epA8+sUZkV+7zGN9PiC8F9ACePsN0+Xn1Iti45yzzKs2hiayA2c7TZ+qH10ksV
         IJ7418X8tVP1DqQbL3bUen1TyZ6zqM5nBaReiW/z61DoxFs9hawse5dSUE9+30Q4L/ZA
         kHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=KCpKTl6XvGj44CPmUuCqmPsUrQ6O6fqS24UeHkl/clo=;
        b=cOk1tiomaSJ4mdpdQubO8xsXjBFf+IVwcVlBxImb4DpdAxVOjfn4upUOcCHbeuoGZk
         x2yKu3iX/qOCIkat6Yu3QvSSmhs9YE3b6yLdFZfj3/1W1AMcqKaqVV8zoD3Nd6IUavFh
         69jVgxnTLmz4Ms1wquolqihIBxcY/6QnMH+qepv08iitRN/ZRO2jCzwlmIBRDmWULFIG
         XMx+2nLOYulVPda3pwW3ZvHeZXg2CK8C72CYsG/zE59HqMOcSkxtZjwUAXy9JXYLpF+F
         f1ZYK+eF9cSPVbFb4D39n2t1XemnJaxl3ahp0ZvLbnf9diXXfte2TXdtDnx3ZSZgLqin
         7lig==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PubVz8uQt74ea1BuQsk759YrihNcCfU2BVnXUeIZizKkP6NujhQv
	0qsru+bQXpRXMfbt6Y6TWqo=
X-Google-Smtp-Source: APiQypIjXXkw9rpNEFuNBvfyIShxkxgKCm1TKfT81Wadm0WNuLR2XeO2YZTQO7Avh+KlMxBNl/upog==
X-Received: by 2002:a05:600c:21ca:: with SMTP id x10mr59505wmj.113.1586441485271;
        Thu, 09 Apr 2020 07:11:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4690:: with SMTP id u16ls8205336wrq.11.gmail; Thu, 09
 Apr 2020 07:11:24 -0700 (PDT)
X-Received: by 2002:adf:ab5d:: with SMTP id r29mr15783523wrc.158.1586441484491;
        Thu, 09 Apr 2020 07:11:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586441484; cv=none;
        d=google.com; s=arc-20160816;
        b=Qgbqu+eYvTt9LgUot52TWTBw8yhld+vSHFEBvll7e6rAIpTzFXZ6Fpj7VXPulAM3XM
         8+PuMXj+DRow7jQdHY1lHAiqceIQw1hUZ8Gbd5Y/SETRPXooXMqP4V7Lo+Vwn+33nm0R
         lqU1vRnFrUuEPxe2wyFBbHPrkGiucsB/QhOpa/hhke0BfeHVJPTZPy3OANHWnhYQXIs5
         zoE9rPeRojIutOmETpEZLdirLz5XqObSlPMpD0QM+4ukMC03zbPoJLmWdPTnDPvZd8mg
         pd5hU9x3WcF2GMQZ9YJjTbGG2uEddunhXx3WuxTVRWwpNdEIy7tU6a5IJtkkKDV62RF+
         b50A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=upShd/bHxoAqcFI1Cl66EAORSs/Sfw8/tC8adWzOl1Q=;
        b=J/B3c3t8kczqEyU9P7zyYIU6Fk3W9QjUtSlzrHs4vM6+fAp2prl32vnpjaoVY7xhaK
         1lI+JkYnQmWKPmY4VxJTG0B6wCJK+0Zg6r53oh+bSUVzVTgxdE2ok1um2oJ8LilD6mLD
         ucV1JjDmi915kVdGNylD2FaBu39SHOJx8wGZVpL+/bymXMRcnzOrpas9LxG6yKI6GCum
         anV5EGsfl1pe/qVacDEPlVhRoU2L/6IYHkI8x7hT1R/jEj1xie/J10ytw2sUf4IhZtON
         x8pGq4fm84eCXvRPqNxdRP+U4XiB2D+CFNdb+WNH2NkIzS1yPqSQLSlVA89Xt+9S/J45
         4tuw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id l20si715674wrc.0.2020.04.09.07.11.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Apr 2020 07:11:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 039EBNun002817
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Apr 2020 16:11:23 +0200
Received: from [139.22.34.184] ([139.22.34.184])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 039EBLIk014322;
	Thu, 9 Apr 2020 16:11:22 +0200
Subject: Re: [RFC][PATCH v2 0/3] IVSHMEM version 2 device for QEMU
To: Liang Yan <lyan@suse.com>, qemu-devel <qemu-devel@nongnu.org>
Cc: Markus Armbruster <armbru@redhat.com>,
        Claudio Fontana <claudio.fontana@gmail.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Michael S . Tsirkin"
 <mst@redhat.com>,
        Hannes Reinecke <hare@suse.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <cover.1578407802.git.jan.kiszka@siemens.com>
 <e11366c8-44e6-2d58-7c0a-f49e497cc240@suse.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <883ab460-77c2-a324-6c8b-eb2e74f6458c@siemens.com>
Date: Thu, 9 Apr 2020 16:11:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <e11366c8-44e6-2d58-7c0a-f49e497cc240@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 09.04.20 15:52, Liang Yan wrote:
> 
> 
> On 1/7/20 9:36 AM, Jan Kiszka wrote:
>> Overdue update of the ivshmem 2.0 device model as presented at [1].
>>
>> Changes in v2:
>>   - changed PCI device ID to Siemens-granted one,
>>     adjusted PCI device revision to 0
>>   - removed unused feature register from device
>>   - addressed feedback on specification document
>>   - rebased over master
>>
>> This version is now fully in sync with the implementation for Jailhouse
>> that is currently under review [2][3], UIO and virtio-ivshmem drivers
>> are shared. Jailhouse will very likely pick up this revision of the
>> device in order to move forward with stressing it.
>>
>> More details on the usage with QEMU were in the original cover letter
>> (with adjustements to the new device ID):
>>
>> If you want to play with this, the basic setup of the shared memory
>> device is described in patch 1 and 3. UIO driver and also the
>> virtio-ivshmem prototype can be found at
>>
>>      http://git.kiszka.org/?p=linux.git;a=shortlog;h=refs/heads/queues/ivshmem2
>>
>> Accessing the device via UIO is trivial enough. If you want to use it
>> for virtio, this is additionally to the description in patch 3 needed on
>> the virtio console backend side:
>>
>>      modprobe uio_ivshmem
>>      echo "110a 4106 1af4 1100 ffc003 ffffff" > /sys/bus/pci/drivers/uio_ivshmem/new_id
>>      linux/tools/virtio/virtio-ivshmem-console /dev/uio0
>>
>> And for virtio block:
>>
>>      echo "110a 4106 1af4 1100 ffc002 ffffff" > /sys/bus/pci/drivers/uio_ivshmem/new_id
>>      linux/tools/virtio/virtio-ivshmem-console /dev/uio0 /path/to/disk.img
>>
>> After that, you can start the QEMU frontend instance with the
>> virtio-ivshmem driver installed which can use the new /dev/hvc* or
>> /dev/vda* as usual.
>>
> Hi, Jan,
> 
> Nice work.
> 
> I did a full test for your this new version. QEMU device part looks
> good, virtio console worked as expected. Just had some issue with
> virtio-ivshmem-block tests here.
> 
> I suppose you mean "linux/tools/virtio/virtio-ivshmem-block"?

Yes, copy&paste mistake, had the same issue over in 
https://github.com/siemens/jailhouse/blob/master/Documentation/inter-cell-communication.md

> 
> Noticed "ffc002" is the main difference, however I saw nothing response
> when run echo command here, are there anything I need to prepare?
> 
> I build the driver in guest kernel already.
> 
> Do I need a new protocol or anything for below command line?
> ivshmem2-server -F -l 64K -n 2 -V 3 -P 0x8003

Yes, you need to adjust that command line - didn't I document that 
somewhere? Looks like I didn't:

ivshmem2-server -F -l 1M -n 2 -V 2 -P 0x8002

i.e. a bit more memory is good (but this isn't speed-optimized anyway), 
you only need 2 vectors here (but more do not harm), and the protocol 
indeed needs adjustment (that is the key).

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/883ab460-77c2-a324-6c8b-eb2e74f6458c%40siemens.com.
