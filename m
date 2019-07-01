Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBN5A5DUAKGQEG7ICYKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F83D5BD4F
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Jul 2019 15:52:56 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id l4sf2782425lja.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Jul 2019 06:52:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561989175; cv=pass;
        d=google.com; s=arc-20160816;
        b=0O9tQEVwg2KdzdxbhOWzCgx/02+tzAqwgrJFv6EiUwBx5x8S3KRU4s14AEAuJ2JZlg
         CzpCPwJmK5nDZrn7PVxBZvriMOVJeUkgoksX7imcf7/cWfNosvKEz/5j/AVeODEA4IVk
         Zs2ZMEoDg413olZvSxe938rjZ+y9QuVslbvmbeOGm3rLhUqW0LfNRaMLG6Pt+BBS9UMf
         BqEAPHexy0zGK3V0mFQkwiAzPgJiSUfg7Hb3Ch2Ng3wzRqlhAv3TFYIUHaouUR2nmoa7
         t1O+rhcOvyzcwxTE/wISO5ilcGxoZQQGLSKDb8VdanLoFm6WZVl9QbYPsdbLWPVQynem
         YQzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :subject:sender:dkim-signature;
        bh=J93eRDRwmOmjzwahruCUpAOw+lY3gWCkjcSbKY0ymss=;
        b=v5lZoGslu3kSLZDXamoYM61J03KsbdrAiXjfH0MiSEbWT7QpUehhwWY+7CIyEx1hMv
         hTXfhGmy2jXmU6/QL1ioxjtmyvUPkemWmcmbtXo6pLUOuUyqHcqzyCnVOZYh2wn+rdDN
         Jzf31dK2vA10mv5Zxg2lB6UnLVrqPLXKHJUQGEmYnNoxpF7Bu9x1DVT/A4Em6qEc0OFL
         +BTMfMVVE7PdKOVeN8c/kg5GkP0NRuJA8SwKyOy5Y4l1oELv0B/tK6EGGCQYzvuvwpVe
         jQM+jqHAfhJLMedeoHrfUvJG+QqniP6WKhTNNS833PZKoWlk8XirqcK6NSeBtbjBbecQ
         w/ag==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=mbA+UJob;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=J93eRDRwmOmjzwahruCUpAOw+lY3gWCkjcSbKY0ymss=;
        b=PBVhxfv7IOrkVs55o/6+ZlpMFnaspgywDOi0N329hohEzcGsNDYtqhfETBBiEILC5t
         ErgGLqVs/WANUyfvrPkCS2FKmGQ6D9+PwvFWyHgHMxwDP/F+E7q7wSpT6YG3khoQmLpz
         BfSi2qGzHk0Mr9zBqGhcDrkol44v0tmV9oEvFecWJHGlBi8S5g7DAjluzJ5PbhUXH8HB
         gJ//KwtW/gKUG/7yFJfY2aQs12Ga9LOszlXjdaTfhw0eMLBp9mQqjJms39/E1aHMe3Qs
         sJddujjxywaCNvMvijhvIoFXpHW2UacefE2jE20rUfr/Bpdk8Ydts6FsU2gt2Dn2/jKS
         jMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=J93eRDRwmOmjzwahruCUpAOw+lY3gWCkjcSbKY0ymss=;
        b=ijPhH/juoDaNFy/ewiVHA8ppCOEAHue2ozIyy9hw0FSWrAoSLH/Ahoo2nCrmjiF6ri
         EemYxU1u7zOP0ZNz/TdT83AjWUE51NNnnNSsjSszNlZyBi2t7qOsWsHyS8NKUqBZSVyz
         0AL65VMqMFVXQVpDnwg5G03pyhpwfoSIsAtUvAP1RTjeC0Cg4MUXZ0Qi/skl0rvkmvxf
         mqKaFJlJAJCtQwiTDfE/HhkYjbHIj+fIq2IyBE13alP/JCRqrcIrIDzQPddNtYGTsyWG
         JsriEJaG8poqjD5dlq28KXbtD4/h/yHNJKOS1T/lPBsALnGtgAHoeG/wwuD6suCArCJi
         a7Dw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWgOVufa1vbpb4yQclHU94TmEoj2ElUn7wZNTvl2BBQ8TwGMmZG
	jhVDtaIUTERGC7tUmtlJLLE=
X-Google-Smtp-Source: APXvYqyHqrmSf+bUMYB1lGWUI68Z77ODJRN2wsllIKd03si0i3pNTYThRZ/9tj8cgLbBqT+HXnTkUQ==
X-Received: by 2002:a2e:2bd3:: with SMTP id r80mr14547283ljr.23.1561989175751;
        Mon, 01 Jul 2019 06:52:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9dc8:: with SMTP id x8ls1144753ljj.2.gmail; Mon, 01 Jul
 2019 06:52:55 -0700 (PDT)
X-Received: by 2002:a2e:b1c1:: with SMTP id e1mr14101193lja.228.1561989175134;
        Mon, 01 Jul 2019 06:52:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561989175; cv=none;
        d=google.com; s=arc-20160816;
        b=kT4oE/RTPbhVsf0ex4Byq+5DzpAnpBeI4DC8rS8JxMflzyhprA2iW1VSSh7RjSyLNJ
         4tg4fjUGdCBdTlkhOF7CXZe4N3Ws+SefNxn8WzQCAUNsPyS9SX7hDIGPvGAkIqBoZveY
         ofRUFg8F/b1sc4T/NbQGmMV3KnF/ldhncRB5X3o1BT+Mi6zpH1QGypWMpo32xLUyxMCu
         S4BMm6Ai5PjFRymuI+a3YYkuqDN70If4CJoRK8Ha+leK4a4V4pThcIZ1ZBGZWZQFDkTB
         MLMIDpKqd3MiiZiZsQJjfgW2b7DBPPXeVp8Z7QyXnWuKOTIdY+1Fba/Q6/jfSmqmzz+D
         oGtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=m6wtmUyfjHvD9Pjzmq7sicmciHAxF2iG1Xxj89t6xwQ=;
        b=As8hwg/G6uDdM3ffXb64vl5x2pyJyL8HG1/ljvy5sW7GkMR+Wo9uyoTr8qZScW0UHk
         ntWP1klBrh4i7Eunxt1fyxNIcrbyzjY1YQ4xHjXGxtlgTHEJHhtNwQYAjuuGzGdNZ7d2
         w3TqsouaksPtn6HQSTtYPfDE2zf7od2dKXBFMi+W0rWd8CtBMe/6XTYq3lJmkWTnUj5U
         8tcYvRNxPM0eXUMhT7BFrUwA5qD9ft1t+tnUmDhOuueTt86m0rgUVFXGvRC6mredvkfq
         81Lc/MN5Lc0gWKEUXKLdEUFuIYcE9iRzldJy8gj4oHlczKYQL1NfeRqCxwatPjEv6cGw
         Lq0A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=mbA+UJob;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id v29si640267lfq.2.2019.07.01.06.52.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:52:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45cpjL3JMPzy6p;
	Mon,  1 Jul 2019 15:52:54 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 1 Jul 2019
 15:52:54 +0200
Subject: Re: Having trouble setting up a shared PCI device in root cell
To: Jan Kiszka <jan.kiszka@siemens.com>, Mario Mintel
	<mario.mintel@st.oth-regensburg.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
References: <525b5e1b82474f3eaaecf83b150aa9f7@st.oth-regensburg.de>
 <bb241636-ed0b-6803-4f34-492744389445@oth-regensburg.de>
 <6417df53-38ef-d810-4e2e-9593c84aeaf8@siemens.com>
 <6a5c3bbf-ea93-775a-edaa-1dda25b08d8f@oth-regensburg.de>
 <81c3353e-88f9-5908-ef76-bbc8f28c7613@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <95e7f303-c5a1-5e52-f012-2df23dcceb19@oth-regensburg.de>
Date: Mon, 1 Jul 2019 15:52:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <81c3353e-88f9-5908-ef76-bbc8f28c7613@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=mbA+UJob;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 7/1/19 3:09 PM, Jan Kiszka wrote:
> On 01.07.19 14:59, Ralf Ramsauer wrote:
>> Hi,
>>
>> On 6/27/19 9:06 AM, Jan Kiszka wrote:
>>> On 25.06.19 19:25, Ralf Ramsauer wrote:
>>>> Hi,
>>>>
>>>> for the completeness sake: it's about ivshmem-net. The PCI device shows
>>>> up in the root cell and can be discovered via lspci, but the driver
>>>> fails while probing with
>>>>
>>>> [17061.414176] ivshmem-net 0000:00:01.0: enabling device (0000 -> 0002)
>>>> [17061.420598] ivshmem-net 0000:00:01.0: invalid IVPosition -1
>>>
>>> The register read-out failed. Maybe a mismatch between driver and
>>> Jailhouse version: Which revisions are you using on both sides?
>>
>> siemens/4.19-rt vs. jailhouse/next. Should match.
>>
>> The bar_mask was copied over from the qemu demo. Other than that, the
>> only thing that changed is the bdf. We simply chose a free one on our
>> system.
>>
>> The memory region behin ivshmem is high memory above 32-bit. I
>> instrumented and checked the code, but that shouldn't be a problem.
> 
> This is rather related to the MMIO register access. Check if reading
> that ID/IVPos register actually triggers a VM exit. I suspect it doesn't.

Hmm. Correct. I guess we should end up in ivshmem_register_mmio() but we
don't.

For bar0, jailhouse registers MMIO 0x380000000000. This is in sync with
the kernel:
[ 1416.878650] pci 0000:00:01.0: BAR 0: assigned [mem
0x380000000000-0x3800000000ff 64bit]

That's odd. Actually we should trap. Instrumentation of ivshmem-net
below gives me:

[ 2044.832898] regs location: 4080053db000

Huh? Shouldn't that be 0x380000000000?

  Ralf





diff --git a/drivers/net/ivshmem-net.c b/drivers/net/ivshmem-net.c
index aba77c232c48..461507b887a2 100644
--- a/drivers/net/ivshmem-net.c
+++ b/drivers/net/ivshmem-net.c
@@ -836,6 +836,7 @@ static int ivshm_net_probe(struct pci_dev *pdev,
        }

        regs = pcim_iomap_table(pdev)[0];
+       pr_err("regs location: %llx\n", virt_to_phys(regs));

        shmlen = pci_resource_len(pdev, 2);



> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/95e7f303-c5a1-5e52-f012-2df23dcceb19%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
