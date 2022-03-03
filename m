Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBTHJQKIQMGQEOYFCTMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 054AD4CBDD0
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Mar 2022 13:30:06 +0100 (CET)
Received: by mail-lj1-x23f.google.com with SMTP id g8-20020a2e9e48000000b00247bc56d2a0sf873816ljk.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Mar 2022 04:30:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646310605; cv=pass;
        d=google.com; s=arc-20160816;
        b=yuCnYHRZbOCI2iPS7bED4gP9x1WHPszwY/QRya1D9TbmSUMlj7u+UhZYRonh16Ui/n
         HUfHR2P9GTZxQ6+sWbQKi5AheikGQaDfJUapHh6kXyWrhf8z2MFF7qi/QlT5hk8bmiGr
         muhbWGwduaEYiA2MRUdrarRNWAHeNnOSMhfiSM6PnRdD1AY0ZgtlFO0HWm9fDO7nKAp2
         zQ5mjDBB2p6AMFnKPbbXVWKFHVqJWh4BpirELUvnG54dNdN6SSlsc1fftGBo7vC2NZiP
         XySPnY4IUpK+asEP2o6WaP46iROzZelVSlc1356eMReOIVVYWHycxDgEvNY32NdBFv22
         jaZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=zs/PboONOPsJInS4Q+KL/J/ldbbm9h/9+eTJuZPaGOM=;
        b=WusrcDv0dc37W4DTd1snbHEeRC/s1cnbTZK0iIdn9zEKFNldJ7kbxIuZs2zn504er/
         vxOn9x67VYIBe9Jwv9YJUWZYh1iSI5c9Cm11sBcRuzWeuFBkj1hJmr9SU6PpkUv6yM8X
         I0mBmyCCcRozmJ6Yo0K5DlXb4KGFwvDif8Ki1gXyc43HXci0AJOb6sU5HWSI1PL8QBWK
         pPMlE56Jmwk1p1vxt/hg1wwxu5v/Itn12KrmtctQhCxKNbxiHQAZaKTmmUsaQ3HYZR+c
         EgGrUmLcrOCav6u9rw7HNBBzdbDrQwio+7D1QFiblp+YgPOYAlnkAjNuoZGK/U/cVZyd
         bN5w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=QB+XSsjO;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zs/PboONOPsJInS4Q+KL/J/ldbbm9h/9+eTJuZPaGOM=;
        b=b0eOWsfNfaI/9mNiViAWQ181ITNi3I/B+1/6jVQezbWXnl9y0Rj4me0RMDygR892qj
         old74Rp9wfFX9D6SmXevQk2RYirbR4Wu84vQIYZ6bbmEJUluOmuU+r01887Zh114eTNL
         F+AQ5pfCGMUAzsA4dmjPxSrGhe0s9w0PTFSg50RlFrm5Im7yYTFHxzAFwAsR64E6Am+b
         NBPqUcB2/YB6nVq71t3TrbK/fQZt/RkHnNnIhfprc83amqcJ4Eil2MbAePvTOOnsujoa
         qsZaRpCJCz6B5CXde+VZohbmdNWYA2kbfPLl+46Cs235RaLr+Y3bnmeXhALd0jIi5Rae
         2xlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=zs/PboONOPsJInS4Q+KL/J/ldbbm9h/9+eTJuZPaGOM=;
        b=7VIp0W2JW5e1R6qr5wzvLKGkJcPM8I6RxRaeAd2uubPqQltFqde8JyDdyU/xNJjY7S
         HrzCPmrjU7xFwKjKD1ILEfhjMLfaoEkp5rDR28RFZMORiJJUYJ9PnlAHFCKAOWFwudyH
         4gdq0hycHRzL2Thiy8T2d6sJb45FQT9G65wyi2bBchNs50FgugsEaMZFwvXT9aGdwZPe
         LRB5D7GWExZazfsOLxE/WRRjcEU2iLq60B8svOo3t02J/I4Lz/67dCYRnpYQZ0DZHTqe
         LOnglRmFH/UecTIqaIZGlafLHLAA0Jbu+2RLwbf73Wph/Z/Ci3hqe/WY9P89XbUDTGbK
         V4HQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531nii+JtI0oQ6UkKCxi0qkH9VPcx6DMfHzMVuv6ga60B+yXn8Bh
	zGtbySmTBqhph7Og4DuLHaY=
X-Google-Smtp-Source: ABdhPJzURbo+/mQYQlDjqE9WYdrQj1vaiQaq/9KLbBM+HfjVUT9Jqweg48oLf98H5jPICxx8skBoEg==
X-Received: by 2002:a05:6512:23a3:b0:445:7cdd:3a4e with SMTP id c35-20020a05651223a300b004457cdd3a4emr19026568lfv.473.1646310605553;
        Thu, 03 Mar 2022 04:30:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:15a3:b0:443:7b15:f451 with SMTP id
 bp35-20020a05651215a300b004437b15f451ls1532057lfb.0.gmail; Thu, 03 Mar 2022
 04:30:04 -0800 (PST)
X-Received: by 2002:a05:6512:398e:b0:43f:db1f:9e07 with SMTP id j14-20020a056512398e00b0043fdb1f9e07mr20733860lfu.652.1646310604006;
        Thu, 03 Mar 2022 04:30:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646310604; cv=none;
        d=google.com; s=arc-20160816;
        b=SSgvyWkgBNEo18ncRAdfHauWu+BUkokzZ6YnWKmIpeBF12SenLA1QujmGvb+Ipmw0v
         E4I57ViSKmX7iZZ1J0flT77d8ugV75UICMcLDriw50a1QElarTgMgoUsfTdtUFWO6PN/
         p+A7FC5NJ9a4Sm72+CA/E66/pk+Wf3C3kp4qaugVwpCNbTVUz2aDDhyNG1MmUO0NT7SF
         IgPzb24AzsWTGIwWv65VkFQ8CqKalAQ7CfW3yaFxI5+MsCO4Fdw31eu0sk55MCMyrfbu
         Pd+6zGQ9YkFpsMmMPIunZZllIQF9IOiZuabVid8fr7fYqtrJ7d10jDCrd6menPTYr/vk
         jzcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8SwTdJpLwg7+XHjT1km1DHjpnB2VBwvqevRy2Q1TyM0=;
        b=eMZW2OW9cvXcKuIM4s0LncAJr0HNVMxLhsHMe5QyQW0vvLCUXkXAlZ7cHx666Zp2d0
         vYagF0TepN0YrYgDsx48YLfaTY7wRIizbFDh5Wje4YZh6uVFlB1F3Nb/oTB8+xQGNe1i
         WI8euYmjqrvUOIPZDyKbbHLLwP2u3VvDt3BSr8XQWn0h5Bd4yPPYL0hzbZLYCh9+nscp
         uolxL+x9IO1clxfY/Q9EKn3j9UtbW0YRWDQKjX34GTSWsNAydeW9et+EPQrdh9TI9OUu
         V8l78eZih7gBxwUEKEnSnRL/PMollcZi4S2pxMVoFn+gdM/e3rIuysl/RYk7KF9vaf4G
         E8xw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=QB+XSsjO;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id b14-20020a056512070e00b00443ab00ddd5si105506lfs.5.2022.03.03.04.30.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Mar 2022 04:30:03 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4K8VgG6BPjzy0r;
	Thu,  3 Mar 2022 13:30:02 +0100 (CET)
Received: from [IPV6:2a02:810d:8fc0:44bc::4ea2] (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Thu, 3 Mar 2022 13:29:46 +0100
Message-ID: <5c3100b5-0c4f-cbc5-d092-d67db0677212@oth-regensburg.de>
Date: Thu, 3 Mar 2022 13:29:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] README: arm64: disable ITS in qemu cmdline
Content-Language: en-US
To: Jan Kiszka <jan.kiszka@siemens.com>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>, Jailhouse <jailhouse-dev@googlegroups.com>
CC: Stefan Huber <stefan.huber@oth-regensburg.de>
References: <20220225142929.385616-1-ralf.ramsauer@oth-regensburg.de>
 <33cd5f6b-5735-e8c0-b161-9ced86292b29@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <33cd5f6b-5735-e8c0-b161-9ced86292b29@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=QB+XSsjO;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 03/03/2022 12:57, Jan Kiszka wrote:
> On 25.02.22 15:29, Ralf Ramsauer wrote:
>> GICv3s in recent QEMU versions have ITS (Interrupt Translation Service)
>> enabled by default, which Linux will make use of. We will crash when
>> trying to re-assigning a CPU back to the root cell, as the root
>> cell's Linux will try to access ITS regions when powering up a CPU.
>>
>> As we don't support ITS in Jailhouse, disable ITS for the moment.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> Reported-by: Stefan Huber <stefan.huber@oth-regensburg.de>
>> ---
>>   README.md | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/README.md b/README.md
>> index f1b0cbe3..b5937300 100644
>> --- a/README.md
>> +++ b/README.md
>> @@ -365,7 +365,7 @@ Similarly like x86, Jailhouse can be tried out in a completely emulated ARM64
>>   Start the QEMU machine like this:
>>   
>>       qemu-system-aarch64 -cpu cortex-a57 -smp 16 -m 1G \
>> -        -machine virt,gic-version=3,virtualization=on -nographic \
>> +        -machine virt,gic-version=3,virtualization=on,its=off -nographic \
>>           -netdev user,id=net -device virtio-net-device,netdev=net \
>>           -drive file=LinuxInstallation.img,format=raw|qcow2|...,id=disk,if=none \
>>           -device virtio-blk-device,drive=disk \
> 
> Good catch. Is this feature flag understood by the recommended QEMU
> version, or do we need to lift that lower limit along this?

Tested in docker:

Debian 11 (5.2.x) supports it.
Debian 10 (3.1.0) supports it.
Debian 9 (2.8.1) doesn't support it.

I don't have a chance to test our recommended version 3.0. So maybe 
lifting the limit to 3.1.0 is a good idea.

Thanks
   Ralf

> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5c3100b5-0c4f-cbc5-d092-d67db0677212%40oth-regensburg.de.
