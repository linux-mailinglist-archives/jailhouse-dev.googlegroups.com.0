Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBBVG53VAKGQEWUT5LUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 6298B95751
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Aug 2019 08:28:23 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id b5sf3483440eds.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 23:28:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566282503; cv=pass;
        d=google.com; s=arc-20160816;
        b=r20fd9MooLoHgDHhu3mEE4ybUrqyVSegyRPGDURZ8lLLloj+6WzewRPX6BMQjqWUSC
         G+93VVGzeS4MXMLts8yn+QyshqgOeL14/HUZTr6ja+my+F5ZskVEPCQzZcI6RYx1rvjr
         UcOG9F/bm1FQdMHmlQYvuf+oB+KiqogAqBONTwygfU6teEfKwA3ftZ3UgstBEmuAA3Ne
         oLhuUr6yW/dJ9zsVTce0Tcw7bT+2w5vNQ+dJolvqRb6MA3QVtptqZqEhZDCmRJRXUThI
         UYSaSGUe4MmUnF6ftyDD49nCXlgfSKE3y7gHdkP5CLDva/20FmU+yW2m6L+eZxHMx/ug
         T6Ag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from:subject
         :sender:dkim-signature;
        bh=H9Vc6NTRuqF2g/Ev6shbDW5tAUtZpEW3yci+zQpwAp8=;
        b=dV8rojnLrbgK8aB3QqL45cTV9Qp8+6Flz6u3CMR/P023xwfUih1FMxKoyuxoKDZtPo
         8EQVX6H03LecLTfiZ3vodfKsrug00QViy3qJ2MsW+y3817bNyLhW82yVqAVEYZM5BQW/
         ZStJ/5LGq1eEaVHTUrGhHxg0mIjGvLp7AZ6WL2+0pnmSeuZgtqEenDlYXBre8ZrCoDok
         juW3sSRVDA4awRDlscBsSq/2cYy3SK3VuTx5tFnkcdaMUcTWkIR6gdLVDbfkmhdce+V2
         YSwUr1rBh8+pq09DqaclhJEXHQEYZd0M3AzEcUF/z8kBBx8yUnRMfsdjDe/VrERY9av9
         FSJQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=H9Vc6NTRuqF2g/Ev6shbDW5tAUtZpEW3yci+zQpwAp8=;
        b=J1FHFk8UYclclKUe1P2qcNbCrHQfckXzlgAsTN1RZQJPT/BF+aHEte3GT872JLRYCj
         /DuJfxXrQNziLAoWwVz8WDaRCmDOfoZpDEN+OHf8P/0Fz6/jEA/LhafceqFuRJ77Kvwp
         0kiJdRPfqaoHrvscxt9Ks5Ry01ZPFVnoZO52+Qm9FLFXDAB/Iy62JRdyF/NGUlkG5/0s
         wczI9H4lgu5G8/a4HYh+kZxW5l6AjnmoE61K4W4OElb+Yd5U30zEXWEF4LPGRBuTeChk
         Dqw/xlXPoUoEl9x2cp9tXe5HkM74tgt/Zcmfv686IiMT50sMWc2wQSAuo5HpKtFhZdct
         6HFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=H9Vc6NTRuqF2g/Ev6shbDW5tAUtZpEW3yci+zQpwAp8=;
        b=TdIRZnAjtFNNWe4Ald2IyZg6N8Z3kXtufDWycVY6IVfPO4DmqDp0ZZV92ViCB2pdGQ
         l0NgZT5nXFYIHbSEcKk83zYf8UBk1iYYgJPXHjJNzWQdYP23z1Wv2/3rLn+FKNotkpj0
         2IT8SrEBjYQODcyYAvuGkMC4xnkH48Pjvr3RkVAMJ2X0F2s9MNSe1rYBAqmaXIotDB0U
         prkU3KUw2L4qWASQncDo+DWYlQvMAQHA2qQkTvqcbrJdCpy2ipFuePh21Pb5RBtIBhXq
         pb36YNp7z4DZmXZUnAGzq/6z2HMq/Gnmtj2dbLYH74TifhLQInHOEyqzyNv66r/lQGkE
         wDWg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVGggLsdqPikJWkybkrra59/uXWLWAfI7g28PYEfaH4MH7LwW57
	q0tW28c5dOj5ZZdnk1JhkSA=
X-Google-Smtp-Source: APXvYqwwHd+hm/WLuxTTQ0G8zAJI08OWusPwq5nJ8moM/3MZ9baMqDjV3E6dCowIdkma1PDMnUhf4Q==
X-Received: by 2002:a50:ab5d:: with SMTP id t29mr29387801edc.32.1566282503092;
        Mon, 19 Aug 2019 23:28:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:8052:: with SMTP id x18ls2334135ejw.10.gmail; Mon,
 19 Aug 2019 23:28:22 -0700 (PDT)
X-Received: by 2002:a17:906:b30a:: with SMTP id n10mr25148272ejz.231.1566282502520;
        Mon, 19 Aug 2019 23:28:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566282502; cv=none;
        d=google.com; s=arc-20160816;
        b=nvF9O33uz7hqsvP56aZJMiArtGkpZtMkYX3YQRvCinmRhDfuPPfGevNy0sI+gNU/qx
         6LjNrXrf+4N7k5pRbZlpj+RHQhzEMOEZzS6F0LJtAKStdQJLTY1ERTMm7xbOnEfn8jqR
         hXVqGzCgjZXqxAmpLe6pWMfABpd3gJ/9QYlRcXB5gYQWauq1q0TlIvTF4dvcidP830Uq
         H4i5sRbhjKMvwgaZUkUb2SUGmOAVsTMOOGE+JfpV2v0dN8WxVz1P37S7+oiaLwlvwQDK
         33iuv2yXXv24RnVBdTev0BnwTDkQwARi3U2bQhBPxEXRXTGDLa1yKjNIyjTvfKyiEZWB
         uyEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=y5cj8UQoXD6j4IwM24zoeUinE2bc5rRgQx2rGNc19qo=;
        b=bV3GRxTKvCSjUCWnfSnVDPq7NGdo3Wi78DGeu+c3G6kPzGbXdRNQTEgdkylKnYe1eO
         NKsUWrex+d7Apk6lyhji5GnGeIRc0qN35bGv6UmXE22hYPwsq4ZbxJollMjtjbbQozs6
         p+CVaxXuJpzBXN8UpFZF/Gl1AB6qK3n3ZkfcmpIlZr3Dd/913EbXOvip7ARAbf+Bak1c
         cVpajfvji5OQgnsdbCQ/sJ2DzYLk+rTHj50qL+S5S60huqCJHV3S1XQaUK9qjXEr0Rqy
         IWyoFjLQqjpOp8I6PmBIJvdnKAWt5c9GkS4WFZYhakLEtzOpmpxsIsfZgR06y1N6sDxN
         qx9w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id l17si974042ejg.1.2019.08.19.23.28.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 23:28:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x7K6SMLV014385
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 20 Aug 2019 08:28:22 +0200
Received: from [139.22.42.98] ([139.22.42.98])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x7K6SLRO003343
	for <jailhouse-dev@googlegroups.com>; Tue, 20 Aug 2019 08:28:22 +0200
Subject: Re: ivshmem 2.0: Reworked ivshmem rework available
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
References: <8d0a6e80-d926-8783-949d-8fd036611492@siemens.com>
Message-ID: <48f69d0b-3057-14f6-efb9-fd525a352a84@siemens.com>
Date: Tue, 20 Aug 2019 08:28:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8d0a6e80-d926-8783-949d-8fd036611492@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 09.07.19 07:36, Jan Kiszka wrote:
> Hi all,
> 
> long-announced, I feel like it's finally in a good shape to publish it: The new
> version of something I would call "ivshmem 2.0" is now available in
> wip/ivshmem2. Highlights of this:
> 
>   - vmexit-free peer state table in shared memory
>   - all key features of current QEMU's ivshmem, specifically
>     - multi-peer support
>     - multi-vector support
>   - unidirectional shared memory (optional)
>   - UIO-friendly one-shot interrupt mode (optional)
> 
> The corresponding kernel drivers, including a rewritten UIO driver, are
> available under
> http://git.kiszka.org/?p=linux.git;a=shortlog;h=refs/heads/queues/jailhouse-ivshmem2.
> 
> The code hasn't been extensively tested yet, so any early feedback is welcome.
> Just keep in mind that things are still in flux, specifically as the discussion
> with the QEMU and also virtio communities hasn't been started yet.
> 
> One of the next steps is demonstrating the feasibility of stacking virtio on top
> of ivshmem2. I also plan to reach out to the QEMU community to ask for feedback
> and interest in enhancing their ivshmem model equivalently. In the ideal world,
> this model will not only used by Jailhouse in the end.
> 

Some update: There is now a QEMU patch [1] which contains a prototype of the 
ivshmem2 device, including a server (required due to the process-based setup of 
QEMU). Works with ivshmem-net and the new uio driver.

I will make this available to the QEMU community soon.

Jan

[1] http://git.kiszka.org/?p=qemu.git;a=commitdiff;h=wip/ivshmem2

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/48f69d0b-3057-14f6-efb9-fd525a352a84%40siemens.com.
