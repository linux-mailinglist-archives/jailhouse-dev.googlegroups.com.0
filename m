Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXWPXD5AKGQEJOKRBSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 487AC258D08
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Sep 2020 12:52:15 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id l10sf364940eds.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Sep 2020 03:52:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598957535; cv=pass;
        d=google.com; s=arc-20160816;
        b=0QU+gL00gBsaleczhl3dfp/xhcqGChk07+wpCgZeLYHB/LhV22A3bDsOd/C3ERsCu4
         JYI/zJsMDSaRyxh2ZMcUxEJbbFck7E7EMsimiGUVhbNtCZAPYEp0S2SRSqwYdh9a/64v
         Lird/++geNtEIl8mNImA0q2FiF1zQzAVe5ThFMndre2eCxZ5ufjrH4PCZzXjrTLsKfOl
         SRBSaiMqSfEOK9ygcEdZJgecU4u2fCA6GxqRSIR+Pp3Zuk6ERoo8gmcMlWfXW/JWMX6H
         u9RlPmGJ/GdA8mDk3u6kcZfqGi0eRY4BiYuVlH+LMhPyMRX5M7J/pM/SEVlGD4YTlikw
         15/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:cc:to:sender:dkim-signature;
        bh=SFHnICPwyj4EDM2kmpaCpI4TwHZCHzDPogvV4JVEmgk=;
        b=mA8wDpxJYNk1UugRaKN7IlkDZDvfdhl8tCA2JUyV439OeLE4z0ZsK6wHn+M/VfRk+X
         m62ziyO0RmYP0RGwyPB/EDlfkkVBZN1RHxe/JISLW8iKBtqfMwsl0uNGmuaEehvn9+ve
         AsFT6ftFrvvzx5T46C2HjTBYoGKiPE4trrlaYXVHZdXGVbRP5zZLC47xWhsPjkKmFGMP
         uEtt2WWz6AYKth0baZA5j3GIPOhi347Jarj1p/8ELx7xs/tz0ltSwfoQ1yPp6k8qOlFZ
         7lxuhmUnn8L8cmBTLJ7aSGiKTBJEFnWyHemnNWCgrWO7C2NuwtsZ61+dxa6kYWkh9wIU
         srZA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SFHnICPwyj4EDM2kmpaCpI4TwHZCHzDPogvV4JVEmgk=;
        b=Sjvqf+EZAO3fkYVrnVVDo17Kdg2dyZXRX4gbQGAj8n9V+DWrFAlPdHRXluuF3spPz6
         TDknr7G7vaulKKuD/pETPhF03h2ZnQzQcopxTe6V1ifFcL9cweUYmhh+Iw2a0tT9RIJF
         cYSGXwZr97/YE+R91bUc15E4h/NcxsPpPmrDk0XbgqJXJIGykDID+HUfFAbon/RJ+lcq
         opkh/5/9PwFrpkO4BtRAQNW9LQq7bSvxLPMdd3Dp5YBbNAlIFSrBLZ5gQVJ3e//D6PfN
         jhYtYkHv1CMVU9odmUrEa7KMtOCGtYOz/iSX7B9eaDgg48ounrXbBWE085YgGw8ruvg0
         pxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:cc:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SFHnICPwyj4EDM2kmpaCpI4TwHZCHzDPogvV4JVEmgk=;
        b=cuHZ8iit60PNRFkB7gpPMGpIVt5qfxm0xWLct8/O9j0Oq34Y+n6N040BforkEuz+d7
         frZCi7U5YKnAMNu5xgX2g39WQjF8IUK6Vaoc6NOPypqq6NfV8XkcY50JH+xcAaTXpeZY
         BFdsxL+him2twfuCk7j2Xw8/gkMpymXXwLCD/1AdoDicy02+mhHXI6VzSuGlia7PuRLG
         xIwBCX8TjQvkKCa2321QuDi+zYfskSPmR7ivXeQSMs7tYaSZ4Y/mqCs+v6RIxy7Ntvms
         jxc0SrllyTB1hmvhbgQRWwzqjuO9fBpRsbnmZm9plHOtPcCv8erZCfNeTjZZLgRm3hCR
         4U9Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533kkxlEGb1QhGHUZQExAySPsQZe8wIo/pWh+1Fqu3xMBFC1JGic
	QDXq3tNg27cOcJuxuaRr+dw=
X-Google-Smtp-Source: ABdhPJx+OEnnN3gWBCbyqjuuEEvaBdelFQp6KD1yYJuGUUUFepzfauUAG19/ZXbdkwIaMnpiS3FVAw==
X-Received: by 2002:a17:906:91d3:: with SMTP id b19mr976320ejx.235.1598957535005;
        Tue, 01 Sep 2020 03:52:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:bc05:: with SMTP id j5ls742997edh.0.gmail; Tue, 01 Sep
 2020 03:52:14 -0700 (PDT)
X-Received: by 2002:a50:fc83:: with SMTP id f3mr1274117edq.102.1598957534164;
        Tue, 01 Sep 2020 03:52:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598957534; cv=none;
        d=google.com; s=arc-20160816;
        b=tUoen0bGoTE5ZAGlwlmRXOv47TsoRcnB5u75iMXxpzfjJW1zMELgQ8HFy91I0n8zVQ
         qZK5yhB8Uak8XtuukTz37HtUd7LqHgD8onRdCibBp/S8XXrwtXsiAnEDF0PFw0Few3sU
         s12cYJ5lGsumfuzcI/sPbNQ0iyHy2qZpYiQ0amAPM9ekbbpnVKyFA/6q/z2wYfDytc5O
         vdeK4F7/I/IdLKRpMjJ5MkJwoZeW3iyY+l9OJHhpnYxY8RZ7XExo9u2k1GA3yyl9qBBb
         IHlGHrcmRzy9SWjLLvCxj8V01yjaHtIRzwKvRJrfd3Wdxswfv2AplLNYEWnvxKeJ/4pg
         gcJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:cc:to;
        bh=jt7atpTffyTs0jn1ipyUh/JP2FPRfSxI4abQ93joIlo=;
        b=cXzBp7zSEE9VUU8siNjb2YM5V4taNExkzsTOq4FEvOV1VlDo9xjNFxMNbEUI2/7v3l
         IwgFRk3SUSYDF6AXAFUQbUtutwsAnGk20FHabUPS18NVK4XUk6MjF1SrQODnofejsKbL
         3xDtXtsa2V2IkMu6huaSvwwxvx1kBq2NAEWSW/o7vm+raAOq5LHZZ1Gv1KEVQJTecF6m
         hRfyT+FR+cUEbfALIEobo9QrCvitscoKmdKvBEUxoKVDvysIQg4DpEzntQRUUukSHNRJ
         tPl4a+QOs+oaAZ/SdxoOMbhcQw2IT6wYmQzotnH9UtqP1I2Xe3BnyEVmX25wupFu0BsR
         bKVw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id dn10si16727ejc.1.2020.09.01.03.52.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Sep 2020 03:52:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 081AqD05017643
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Sep 2020 12:52:13 +0200
Received: from [167.87.3.153] ([167.87.3.153])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 081AqCol011168;
	Tue, 1 Sep 2020 12:52:13 +0200
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Prakhar Bansal <itsprakhar@gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: Jailhouse driver for libvirt
Message-ID: <717c8146-b760-2cfa-170a-f70384457b88@siemens.com>
Date: Tue, 1 Sep 2020 12:52:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

Hi all,

just a heads-up for those not following libvirt: Prakhar finished his
GSoC coding on adding a driver for Jailhouse. The patches are on the
list [1], and discussion is ongoing with the clear goal to get things
merged. Everyone interested in this topic should have a look and is
invited to join the discussion as well.

Thanks for your work on, Prakhar!

Jan

[1] https://www.redhat.com/archives/libvir-list/2020-August/msg01144.html

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/717c8146-b760-2cfa-170a-f70384457b88%40siemens.com.
