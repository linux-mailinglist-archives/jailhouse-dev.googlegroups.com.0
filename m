Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBDESWSFQMGQEYRDOXPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 59975430FC6
	for <lists+jailhouse-dev@lfdr.de>; Mon, 18 Oct 2021 07:41:33 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id y142-20020a1c7d94000000b00322f2e380f2sf1499198wmc.6
        for <lists+jailhouse-dev@lfdr.de>; Sun, 17 Oct 2021 22:41:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634535693; cv=pass;
        d=google.com; s=arc-20160816;
        b=l2eKM2fxw5gYQexW9AMHhlYbovdVfqrg4X5co4ziRqRTI0kvP0Sfj/72oxgye3h8zQ
         buxDWpV8rp5U2CX+950CRAHFQD3xkFUvCNdv6ZlJFZenX4TDpwj9uaYIQWBUCmkW4adt
         QEGC6VwgEiznQlP570FbDMzGM/YxBFVe2RFuP12aXHCb5kvmQjyxqumFAv+a9tbUkxYA
         Xp+iUotiAaAoTUNfRihyLZ3CkZnPrAbTbSOIg9/soF1Oge6y7jENS/7aopEQdMENp+Zu
         Z21XsS4S0twqAoHsA3QWcY6NB+sKba6ScOm0YVxd6oAd4ZDQJc3qcOCfcJYFGvv9cSmd
         MjOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=DQy8bfXCoHbheJ95Fmn4xsCpFYiU3lP72pnR40Jne3c=;
        b=cy8CaFSTmhHKTpStfQheDvmcg0P7+LLe0RiUwJlesVfN6o+WjXv+j9VvNyk6V2pEbB
         L5u6V4PoO4SIMkGaeWllu2Zhes7aY1SZPDxhUzdx79TWUqamlfPIvuYAYxcRKSG5HUGr
         hvVMlycFvhKIxfFAamMkIm47qB/I7c0ycOD9CjzQJwoT3aVZYDJQRZZASSE+c4IyFGPQ
         qXdoQxvBDqNsi09T8KmYQvxphVuXoRtVBD4q7DFL0s4FzCgWBmThtNNyZHM1UpqtF62W
         kNfgiOBScXctMRtj+9XK/sWZ8xnuPWvadractsQ7PtgtbgyLpP3jLZiLa+17F4bXDrB2
         RTsQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DQy8bfXCoHbheJ95Fmn4xsCpFYiU3lP72pnR40Jne3c=;
        b=lN+pxoPa8fmh4hT4evjn/uRRTanWE9xqLWCyc4Q/AGSXc10aL05pOPt71FgBUYP5L5
         dgvxZe6Wwb77h1hUsuJVBP2cpYwtyIg/vYI3l3aa3g5pqAOvqeLYDkRfAHwTQMQQA2U3
         x1CxchgW2Dd1QOnQEqwBfnhX1J8YBXWEVUwsOLukjeJSdYH4lxu9bpHChGbk5K4mNH8J
         ZrZYseAybDzNYoOZnGcPYW/YB15O5jptGi8zmGOUIoKX+TPedGne02LZFgakjJj4i9AN
         +l1RmyafAuIXwMP/wADtOkbcsoys/JDj1jVl9b8uL96Rv0ximWmGepHVmEnrqQqwEv8t
         kojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DQy8bfXCoHbheJ95Fmn4xsCpFYiU3lP72pnR40Jne3c=;
        b=zY78mzs75KHvJY0jhRrLIJK0HVZR7sxtfrVE4H/V05FiBz7ezXWMCvD4p/pYn8NvxT
         O99ic++F8lX7yH6FUldAPLoUguCYuM3hDvHcmTZXAvvBoFP+XgWYtBS1nJKMJ12q1Pbb
         8HWvjHkyCLVf8N7VBQACg9WfMEF2FTNPfz8rS+5BtxlvPJLGVj+t1Dmnold2FCUKlAV8
         RQNaQgsYefwnCj9zzF6bmEGK1yn8tXDqX737iyC2HQefjT1SC93gqeaF6KpSG0BBaSAT
         SstVSSxLG/F5FzJiz+o2fwCRUBRAQKfUnVPPeoINE0pvmWpBtutGjc5Pd3Sy/WB8cW5P
         /HRA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531K/ewMXZQwxIEBHH8YkF6fKlss3qalIvQOvnQ97Hn9ejvcuzNk
	mIk8RoYfNKSsVPMDcpFyyds=
X-Google-Smtp-Source: ABdhPJxAz9fevmrVCFKJuiylRnyaN+ZSMrq8buefbZI+RV9rivekdlyRfbKCBWaLJFWajacZTiC+xg==
X-Received: by 2002:a5d:6d05:: with SMTP id e5mr32788323wrq.300.1634535692975;
        Sun, 17 Oct 2021 22:41:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3b13:: with SMTP id m19ls197349wms.0.gmail; Sun, 17
 Oct 2021 22:41:31 -0700 (PDT)
X-Received: by 2002:a1c:22d7:: with SMTP id i206mr29084418wmi.122.1634535691920;
        Sun, 17 Oct 2021 22:41:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634535691; cv=none;
        d=google.com; s=arc-20160816;
        b=hSeI1VL5F1LqgPnLUuP2wh3CZEmpL+SqH6YhN+T8MT3CxHJ46+Jjdep/vx7Sze1cAr
         W4hbXY6wfueMR6WIFK2clSkLQzj3FQBm2+h9GPsafG8SRWYFXME8P0XOhff9ch/jg72/
         2yeiRPGuUMIMrDzrpTweqe/B4co4sSJvyqTyBxtHbWD4UHYw0hycwvVCHUWbVQV3g9zq
         csgn56bQUdz8FLBg+eK9zFhjQ8JZdjYjkjdALw9H/bkxgryUAN5sPJXVi+VyrKpy7pqL
         3zS/Ks1aiOejXV9wH1qp+T5B2QrKvBgjXw3kmcDpFmpPBRVO5bY90WjWGZJed2/Qmo7T
         BKYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=1znGi85DC2Xsb2rukOVrYRyQgr6fresvL4yGxnnge6w=;
        b=sQJkfVFcDSkZrxrclBDYmuYdjmA+9LEXHtYtN7YKr+C6aBL9CeQBEH4ddAvJvxypQ1
         aH9MPBhLSMngz6qL84Rbox33/t/MnO/Oi3ovJJfL01icAyPZFz2jdsAJnseyGALGKjVF
         Qg3b4UHrDokx6TjQ7tmoPI0WI3YPDpPaRz9YEunPbiLT9NA1vCgYaTDU7BIb3LviE1pu
         XvUf4pj+Xqa9ZPe5feSNPdo/lwumDqOH9roqKwCDV2oU8TRiAFQLLxexb03thiOazNit
         f2q1OJlY4CWg3zK/yw/bqIYbDe70Pde5UofiYSQt3tvQbSVSOzvZ5fse6Rr4N9Db+dRD
         ycIw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id s187si199270wme.1.2021.10.17.22.41.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Oct 2021 22:41:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 19I5fVXl011872
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 Oct 2021 07:41:31 +0200
Received: from [167.87.73.119] ([167.87.73.119])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 19I5fUHj011968;
	Mon, 18 Oct 2021 07:41:31 +0200
Subject: Re: Questions about Jailhouse
To: Zheng Chuan <zhengchuan@huawei.com>, jailhouse-dev@googlegroups.com
Cc: Xiexiangyou <xiexiangyou@huawei.com>, changzihao1@huawei.com
References: <830ab7e0-e8b9-edc7-8a3a-4acdb8b0216c@huawei.com>
 <58cd66eb-1988-cef4-09bc-2438f790f7f8@siemens.com>
 <ff1a563e-1e41-dd4d-9899-67f8de4d11bf@huawei.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1c48728d-c3f1-a30d-3c52-0ae68f11b040@siemens.com>
Date: Mon, 18 Oct 2021 07:41:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ff1a563e-1e41-dd4d-9899-67f8de4d11bf@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 18.10.21 06:24, Zheng Chuan wrote:
> Hi, Jan.
>=20
> On 2021/10/14 17:34, Jan Kiszka wrote:
>> On 12.10.21 13:57, Zheng Chuan wrote:
>>> Hi all,
>>>
>>> After reading the code of jailhouse, I have a few questions.
>>> 1.Once Jailhouse is activated, the boot Linux will run as a VM. If it i=
s possible to run VM by KVM(nested mode) in the root cell?
>>>
>>
>> Nope, but you can find traces of an attempt in
>> https://github.com/siemens/jailhouse/commits/wip/kvm
>>
> OK. I'll look into it.
>=20
>>> 2.I wonder why the root cell need to runs in guest mode? Whether jailho=
use can run root cell in host mode, create KVM VM inside
>>> root cell. So jailhouse can support both partition and VM.
>>
>> Two main reasons:
>>
>>  - security/safety: If you leave the root Linux running in host mode, it
>>    becomes part of the trusted code base, increasing it by a "few"
>>    orders of magnitude
>>  - functionality: only by intercepting certain I/O accesses, Jailhouse
>>    is able to emulate the ivshmem devices
>>
> OK, I got it
>>>
>>> 3.When create a non-root cell, the jailhouse driver executes cpu_down()=
 to offline CPUs, but the offline CPU seems to be running
>>> and respond to interruptions. And the hypervisor seems to have done not=
hing to wake up the CPUs(assigned to non-root cell),
>>> or did I miss the important part of the code?
>>
>> The offlined and then "stolen" CPUs of the non-root cell are first
>> parked and then finally started again at (amost) architectural reset
>> state when doing "jailhouse cell start". On x86, you can see the SIPIs
>> being injected for that in the Jailhouse log.
>>
> Yes. However, I am still a little confused about the status of "offline" =
cpu.
> i. On x86, is it at real mode or protected mode after we do cpu_down() wi=
thin vmlanuch?
> ii. is that different from cpu_down() of host?
> iii. on x86=EF=BC=8Cdoes it conflict with the bootstrap of linux guest si=
nce the kernel will do transform from real mode to protected mode?

We hand over the CPUs in real-mode, as architecturally defined. The only
differences are:

 - reset address can be configured to be different to 0xFFFFFFF0
 - all CPUs are started at once in a new cell, not just a single boot-
   strap processor

You can study that by looking at inmates/lib/x86/header-{32,64}.S. This
is the code run first after cell start when using our own inmates.

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
jailhouse-dev/1c48728d-c3f1-a30d-3c52-0ae68f11b040%40siemens.com.
