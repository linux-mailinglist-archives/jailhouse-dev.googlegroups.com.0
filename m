Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBBWF5DUAKGQEOIJHDTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F475BF21
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Jul 2019 17:11:03 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id a126sf3193614wma.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Jul 2019 08:11:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561993863; cv=pass;
        d=google.com; s=arc-20160816;
        b=puQ69DCLAIE1m1PYIVq7iLaxPdQVBqESWfoZq5Tc/q0TcC76+vSbIghKWtLMZWLyUV
         Mq+cDyxJaBWo5R7pOL+05fAYcZ4F3IEW1zYfe5QznvdhZCoa/s343BNJnAcy9XI99YjK
         yRdSVQGmmJtuLDuG6TH3RZH2atpHXLAfY1NnQzYSsNOVPul3jTYkqXHgMbynoGVypmYq
         rU1Bsti946ew3wokgp6HKCO56qOuuwzYfBHL5VBAKeQxI+TmtF4NDSrAGI4njs2+hBug
         GL3IYMsJhC8bI8e8T9jBxfr5xQs1QjnMbE1T9NwhHfvtjXD9uGC0j+SB2OvpNq7XnSdZ
         KGvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:subject:sender:dkim-signature;
        bh=wYNMMVb7sgYxms4pq8hzz/CMNI6uHXIGKjf5vc4lYr4=;
        b=BmTBYjGVZpo0pPElulisZjg5W2Q3r9UaHgdeQNBlXdnRS/XMNV94Frb5X0Psyf8J9p
         XCiIcvgsJ8/Qes+4+etFjRSJou7oMQqfmCBJ4EI2d5kUX2g49ezHAFPnzmNjFjqBup1q
         lSPFsyGnq68QlyY5hC0JCTJF9F2ImxOZLhCijIdc2B3XBMyH5FGsgATCwArYHXMRrE/a
         wyhPF/uA/8btXUgeDloOp4wjRII0oIqFhvtiWIi99fKecaEUEIe0boGX3TvwdWL3L5Im
         Gqit8GaLn4wj2gKkOa4IkstGzKB9E6KHG6HHl6GUkX2eUqzlA6vpi53bGlw7S5g/JexZ
         y8kA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=gp1XyhlC;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wYNMMVb7sgYxms4pq8hzz/CMNI6uHXIGKjf5vc4lYr4=;
        b=eyQpYp51K2D5ddQNEkdK5Qmwlcg/widGCGFy0GVFyTkf8VV+pKemMlF7ofsToTU2vT
         inIKH0wB7OZ8fUqBdr3SmCp5txxxSeUiIpl2CgXWlJOdyFIwjGG5npDKWrVaKf6qApT2
         kHKWGTcDwdn0NJZvN2o6ixjUkaP4xIWbz/WCCWEGJz0p4cjp/BgTFeCxgxSk7LyyKZkU
         S2yPlpJvDanf84R3VqnrXpA7f9cSmde+6v635ZiN7Ifg7Jss+OQ/dtNUjNOEy0w0IDgG
         gcWy6H+FkS0Dy3Y2W83f/8aOxlnS7LpNwbhKa+jixHBSkfUF5vChZE0RQK8ignTkKOWg
         5dTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wYNMMVb7sgYxms4pq8hzz/CMNI6uHXIGKjf5vc4lYr4=;
        b=m9U1og9V8m1G874wb5zFP71mviuEjiyedQ/wpic/b18f3o3ZO6S8oAVPtbIgd7/7qW
         znWxC8B7h3gn9FNSC0unyY4miM1dyW42eU2WCEJnCvrJoHPZM/esalx/Z0w1DU/tYOJW
         1wcoUda8kaAd7ntM1BaEilkdhXRGYtyIMqnaD1UAhJNv4xCguhpgTkLFS2uYOtx3Hn/x
         E4bC8ixYawdu+R2xsOBS1hbEqUc6JRTRXYO4Hanf1+/J4BZ/SLcODwL0ulRrczwKknx3
         lQ7nJRIfRQEU8isH7ujzqAiMoZJMGg1UMBqtEMbSjebHY1FyJ7Mb2Fgh+cSuNztXIbWZ
         zZiA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUTPdKmCCuMWiD0Izn6BGoh+rCMoLfbAHKu4SNbUO6AJJTbLSV8
	R3SFkwcbR6gU8RtWdty0szU=
X-Google-Smtp-Source: APXvYqx3lh5DEYXeTplRWqU3ylo8AirNOykf8tNdje9R4wOmNdjxE6YnTxq2J/EUlX0/3Xgxd2+BVA==
X-Received: by 2002:a05:600c:389:: with SMTP id w9mr16647123wmd.139.1561993862896;
        Mon, 01 Jul 2019 08:11:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6b50:: with SMTP id x16ls1130805wrw.10.gmail; Mon, 01
 Jul 2019 08:11:02 -0700 (PDT)
X-Received: by 2002:a5d:5009:: with SMTP id e9mr15144539wrt.279.1561993862374;
        Mon, 01 Jul 2019 08:11:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561993862; cv=none;
        d=google.com; s=arc-20160816;
        b=s9Lr8Phiro/vpLhQEi4lIG8qoEsys5AMpYE3VZb44kFK+71yaQTk2ilvSnvIs3NMr/
         ijeHSuUKtd+1LulZOOa/+o0cWns/yB4+nJsY9XNvap10QMRFkzA76/Q/gpHhoN4yjQET
         9LsIRXLJaHPG9VBzhGHfzzgm9/dmSD/f6MV4vPWAzq+mpaN2UzAJwd4RLEwmtaSEaeeb
         ac9O5DM/ylFwHyCQ/0CALMaAZFdGp48mFkpaJOsCyJSJd1Zd8imOBzaep+bJ87Sv17wV
         YVsNdHmpIGBb7fjQkrWWPl1MRxOsyNbyc3WOeMPvxo/OBeiLAwPXFNpq/qypL+ULIq/i
         kOgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:openpgp:from:references:to:subject
         :dkim-signature;
        bh=S/Nyv13hhHfzA49pf2/wt2IdVOLM1UlLTBOdZdcGfuc=;
        b=vvGo1gIJnAo0b71jt55Exv2mYwQ8xxMVxAh1dGFiwfU5MhA75zSc/c/L4NUTgBoCoO
         sjwiDEObANU/Br7yemx2RYBsx0LDrglU+dKR7XCFkDkahUn3bMfAHPPKZeyAJTWucz0W
         qdTud+LgGAyqRsugYR8DSZoTLgsnZXT3RStk/rRgOJ8ZfgiJAL03TtPAtCMIDjcVjNAn
         aRurg4Ast4ElzMxsqukToVFAkQi+AbrbznguPJ9iIF0IdKLMySym9z9HDd099uHRLEFI
         UmShZTT0T5kTVcL9EfEBsq61gTpVfDCJL3viJB33aXiSp42/SfeBc+PuVNpzC2eHr880
         QmjA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=gp1XyhlC;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id u18si466863wri.5.2019.07.01.08.11.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 08:11:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45crRT73chzxvK;
	Mon,  1 Jul 2019 17:11:01 +0200 (CEST)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 1 Jul 2019
 17:11:01 +0200
Subject: Re: Having trouble setting up a shared PCI device in root cell
To: Jan Kiszka <jan.kiszka@siemens.com>, Mario Mintel
	<mario.mintel@st.oth-regensburg.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
References: <525b5e1b82474f3eaaecf83b150aa9f7@st.oth-regensburg.de>
 <bb241636-ed0b-6803-4f34-492744389445@oth-regensburg.de>
 <6417df53-38ef-d810-4e2e-9593c84aeaf8@siemens.com>
 <6a5c3bbf-ea93-775a-edaa-1dda25b08d8f@oth-regensburg.de>
 <81c3353e-88f9-5908-ef76-bbc8f28c7613@siemens.com>
 <95e7f303-c5a1-5e52-f012-2df23dcceb19@oth-regensburg.de>
 <065b2f28-c115-41eb-5f3f-8f99fdcbeb91@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <6ecf8f54-53f3-1c72-b9a6-ce9007982975@oth-regensburg.de>
Date: Mon, 1 Jul 2019 17:11:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <065b2f28-c115-41eb-5f3f-8f99fdcbeb91@siemens.com>
Content-Type: multipart/mixed;
	boundary="------------9246EA27363E8D9F4F383D37"
Content-Language: en-PH
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=gp1XyhlC;
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

--------------9246EA27363E8D9F4F383D37
Content-Type: text/plain; charset="UTF-8"

On 7/1/19 4:04 PM, Jan Kiszka wrote:
> On 01.07.19 15:52, Ralf Ramsauer wrote:
>>
>>
>> On 7/1/19 3:09 PM, Jan Kiszka wrote:
>>> On 01.07.19 14:59, Ralf Ramsauer wrote:
>>>> Hi,
>>>>
>>>> On 6/27/19 9:06 AM, Jan Kiszka wrote:
>>>>> On 25.06.19 19:25, Ralf Ramsauer wrote:
>>>>>> Hi,
>>>>>>
>>>>>> for the completeness sake: it's about ivshmem-net. The PCI device
>>>>>> shows
>>>>>> up in the root cell and can be discovered via lspci, but the driver
>>>>>> fails while probing with
>>>>>>
>>>>>> [17061.414176] ivshmem-net 0000:00:01.0: enabling device (0000 ->
>>>>>> 0002)
>>>>>> [17061.420598] ivshmem-net 0000:00:01.0: invalid IVPosition -1
>>>>>
>>>>> The register read-out failed. Maybe a mismatch between driver and
>>>>> Jailhouse version: Which revisions are you using on both sides?
>>>>
>>>> siemens/4.19-rt vs. jailhouse/next. Should match.
>>>>
>>>> The bar_mask was copied over from the qemu demo. Other than that, the
>>>> only thing that changed is the bdf. We simply chose a free one on our
>>>> system.
>>>>
>>>> The memory region behin ivshmem is high memory above 32-bit. I
>>>> instrumented and checked the code, but that shouldn't be a problem.
>>>
>>> This is rather related to the MMIO register access. Check if reading
>>> that ID/IVPos register actually triggers a VM exit. I suspect it
>>> doesn't.
>>
>> Hmm. Correct. I guess we should end up in ivshmem_register_mmio() but we
>> don't.
>>
>> For bar0, jailhouse registers MMIO 0x380000000000. This is in sync with
>> the kernel:
>> [ 1416.878650] pci 0000:00:01.0: BAR 0: assigned [mem
>> 0x380000000000-0x3800000000ff 64bit]
>>
>> That's odd. Actually we should trap. Instrumentation of ivshmem-net
>> below gives me:
>>
>> [ 2044.832898] regs location: 4080053db000
>>
>> Huh? Shouldn't that be 0x380000000000?
> 
> What's "regs location"? What does "lspci -vv -s 0000:00:01.0" report?

pr_err("regs location: %llx\n", virt_to_phys(regs));

Please find the output of lspci attached.

> 
> Hmm 64-bit... FWIW, I'm going to remove that "feature" from future
> ivshmem again, moving things back to 32-bit address space.

But we do have:

380000000000-380fffffffff : PCI Bus 0000:00
381000000000-381fffffffff : PCI Bus 0000:16
382000000000-382fffffffff : PCI Bus 0000:64
383000000000-383fffffffff : PCI Bus 0000:b2

> 
> That said, this constellation may have triggered an issue in ivshmem or
> even the MMIO dispatcher that wasn't visible so far.

But will moving the memory region to 32-bit address space solve the
issue in this case?

Thanks
  Ralf

> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6ecf8f54-53f3-1c72-b9a6-ce9007982975%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.

--------------9246EA27363E8D9F4F383D37
Content-Type: text/plain; charset="UTF-8"; name="lspci.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="lspci.txt"

MDA6MDEuMCBVbmFzc2lnbmVkIGNsYXNzIFtmZjAxXTogUmVkIEhhdCwgSW5jLiBJbnRlci1W
TSBzaGFyZWQgbWVtb3J5CglTdWJzeXN0ZW06IFJlZCBIYXQsIEluYy4gSW50ZXItVk0gc2hh
cmVkIG1lbW9yeQoJQ29udHJvbDogSS9PLSBNZW0rIEJ1c01hc3Rlci0gU3BlY0N5Y2xlLSBN
ZW1XSU5WLSBWR0FTbm9vcC0gUGFyRXJyLSBTdGVwcGluZy0gU0VSUi0gRmFzdEIyQi0gRGlz
SU5UeC0KCVN0YXR1czogQ2FwKyA2Nk1Iei0gVURGLSBGYXN0QjJCLSBQYXJFcnItIERFVlNF
TD1mYXN0ID5UQWJvcnQtIDxUQWJvcnQtIDxNQWJvcnQtID5TRVJSLSA8UEVSUi0gSU5UeC0K
CU5VTUEgbm9kZTogMAoJUmVnaW9uIDA6IFt2aXJ0dWFsXSBNZW1vcnkgYXQgMzgwMDAwMDAw
MDAwICg2NC1iaXQsIG5vbi1wcmVmZXRjaGFibGUpIFtzaXplPTI1Nl0KCVJlZ2lvbiA0OiBN
ZW1vcnkgYXQgMzgwMDAwMDAwMTAwICg2NC1iaXQsIG5vbi1wcmVmZXRjaGFibGUpIFtzaXpl
PTMyXQoJQ2FwYWJpbGl0aWVzOiBbNTBdIE1TSS1YOiBFbmFibGUtIENvdW50PTEgTWFza2Vk
LQoJCVZlY3RvciB0YWJsZTogQkFSPTQgb2Zmc2V0PTAwMDAwMDAwCgkJUEJBOiBCQVI9NCBv
ZmZzZXQ9MDAwMDAwMTAKCUtlcm5lbCBtb2R1bGVzOiBpdnNobWVtX25ldAo=
--------------9246EA27363E8D9F4F383D37--
