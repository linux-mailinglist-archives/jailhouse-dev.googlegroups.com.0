Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBRN65P6AKGQEIUD46LA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7905429EFBC
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 16:27:02 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id 11sf512619lfg.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 08:27:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603985222; cv=pass;
        d=google.com; s=arc-20160816;
        b=mDFw7v3KImaZJwzXyQmLTJHzW7ZaIJx/zq5n6LqdNjwGBa/8qskkZ2j/V3Y3d1eQgu
         a2uh583fclb77j1t4wI6b6RduHK5Eww2quAh/ZnV7m3BD8Z1FoFIjFU83hTIskRs60ci
         vESgvDHB9HiNlu3yw/KLKRW2QWxX2QsXahFCkOHsfq66PLhnGybQCjsO1C8XBF6NP7jQ
         Xcdg2yom1RZFssAckawQ5U2rYGQZZMipMP5fPTczFXIfAt1Oi1RXTHgAHVxEEsnKcqZQ
         3M6xBlGHxGdl6lyqnlkpmML4mkXUXdMWQtaAVC53dyNRjQYYqNn2/4Jqsmv1PT/wEKJr
         3C2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=2m3P+MwiltO5mW9jcyyB4KedgNJO7617Z0ZNQClhmts=;
        b=WjUiM0UOepbG14eMQy7tkJBmmT3wVHpMVvDxuZTkPbUjzabtfHii5SOyfjI27yd138
         Vyg4X1meYPwL+7en3TNMT6iNYTRq7labDe2aC7xaUbP5vqbssAC8KgZ5Y51dDM9THJpf
         0oFb/VDKE6E6RCOituV294l8i4KZeCrqo+dscufKB9jtjrezkbrZFDJI9team4xpsCZQ
         WhmSJjDlrOZMZrD8IpXzLcER7iwHYB64aKgYZQBTM2iKtsVAUQ6dlMOQY0tqft+aYJLM
         mgBGASwemRUfJrRpqnSkndeZ52AlG9SZOsDJd18NEYHjRIecB2EAxaHozyvFNPUlEuVV
         Nf6Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=M4BJUz2m;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2m3P+MwiltO5mW9jcyyB4KedgNJO7617Z0ZNQClhmts=;
        b=EtM5H6CbCG399MAYzkBTP9yK6/gPKKSfQMQ1e/PofcCxZCzj2YKUY7OYaCAHXOKA0M
         87BG7dMLR60OhTxpa9CfvvflEBWHmg59eSAq0AhgwRQ0811v6c/KRePg4HSvqVKv1g3s
         WJOJPZAoF2VuurV75RDOKVrTMejJ8JAkdSn45TLH8JvwNcPj0vxYnOWYknPl2fponJQx
         JZCRNpXOh2oUetG01yPMts8sshRzCcGVNledpfMshgDiI/zod243+g7PECVR22TSjD7X
         DX+eQz7Lu5TpgNTQ/dYyxPNNOtzi8JJBSSEV/vAPHQftO9X0lTn+pUVvc1FF5zzlk5lU
         pD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2m3P+MwiltO5mW9jcyyB4KedgNJO7617Z0ZNQClhmts=;
        b=Apf2cCCUsuXcN2shttUC7vJEGmquQIqKAZJcdE3/on+BkdQ20jG/KJQXqUkgd118Ra
         4CFmQCEwvgWZGPrR5GYYAO5t60HvFQ0TeziOn9r0w0LlBgMNzRy4fZ5AUMlEoIdc2yEr
         FA8/8cbhH31Kr6mijGokr4DqyThqddTSwpD5QFugvevkhe+CMB7M1PDAQ4+600nPkD/h
         f2gS3MbP0vZ4knl8bnNCpP23H2+vVxbwMerxjdWRKEdGC+np0Dmra8eaCa0dAQI2KTBo
         TgzFv0LFg7eVJq1gbZDrcFe1YyFtq/+NgfMA0N5HyFZ/Dn3hyqcqnV1z0CAFgFc3+msb
         AOBw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530x4JimTfHeF377OHfaxWgj9WNIuryTEd1KUUei32oLLYcfTw9i
	I3XxqMxHxTvBuqsUSdOFnOM=
X-Google-Smtp-Source: ABdhPJxqq+qVHuHUacLO+I2PT+j7u2Psa1lUJXTRiteGFucK3x2Bwq5q320q0dS4MySHDVfou4qAoA==
X-Received: by 2002:a2e:9657:: with SMTP id z23mr2119307ljh.8.1603985222015;
        Thu, 29 Oct 2020 08:27:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:998f:: with SMTP id w15ls200626lji.4.gmail; Thu, 29 Oct
 2020 08:27:00 -0700 (PDT)
X-Received: by 2002:a2e:9ed5:: with SMTP id h21mr1929211ljk.178.1603985220766;
        Thu, 29 Oct 2020 08:27:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603985220; cv=none;
        d=google.com; s=arc-20160816;
        b=ejk//C9kNV7gfuVLMywfGObwrYal5h7PyJb5/Pe9yYUpFLhhU+7JsWDjwVh46cyp+o
         LVnvpJU+IkJ3jkCbPmCM7Aa69/l4Eva2Kv0I6xV1SR/NmpBM5ZVRSvr5+uedBIvBHYxm
         3yBqZWq8h/jCAg/jW/c8KS4knKuU5VMhb+PFTJ4OWZ0eCF2tAaobkzxG1F0g2VvOTyo1
         cs6ztH3PtBVIR6jPZGs+kULavT5JAXz2GYE2eUheXJRCOdB/SpOH8xjqeY2upDbyAAAJ
         SJPcOpkUeLbkMi1jQjBFj7Fcgd+9gB9cibBM61jVEMEVMbUh72ldh8HRk5BX7Zj3BjUK
         madg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=3nuvzWN00RYmJVA8AsDkuUSrcEIOJwpL7u/rewjf8ss=;
        b=0i3Isthb8H3Qls6d0fJxSpvz8sWx9P24/DQ5uQyox+0GPt6QTeFiPiI1+poF2w0wVA
         ds20yMG03w4TZMb2DQDSQ1A4iJCp93PT1yWUVli4sH+2XBUR70Xg3yeTSU0tpUdglE6P
         pgYMKkS+GIXYlc/QA/AhZzeX1lv2MJmEzzkfiiCenrC56DMNgsId7bJD6TnpRjXNTjT7
         DvAC+pQc0OOGhfUPOYR/Rc8XyQopdGJajO00LvOULaa2gXR4DNkqR0KUR7RwkQs104s9
         XOLsl2oBz5aBdoIVYTa1KhS7Ze9PACEgJf+YDczIni8pC6queqzDDsnh9rNllwHOc0mS
         GkGw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=M4BJUz2m;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id t13si109825lfr.13.2020.10.29.08.27.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Oct 2020 08:27:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CMTnc0fKxzyYv;
	Thu, 29 Oct 2020 16:27:00 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -3.134
X-Spam-Level: 
X-Spam-Status: No, score=-3.134 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_CT_PLAIN_UTF8=0.001, LRZ_DMARC_FAIL=0.001,
	LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001,
	LRZ_DMARC_TUM_FAIL=0.001, LRZ_DMARC_TUM_REJECT=3.5,
	LRZ_DMARC_TUM_REJECT_PO=-3.5, LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001,
	LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
	LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_AAAA=0.001,
	LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
	LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001,
	LRZ_HAS_CLANG=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001, LRZ_UA_MOZ=0.001,
	NICE_REPLY_A=-0.261] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id kNeTb2VHUtFF; Thu, 29 Oct 2020 16:26:59 +0100 (CET)
Received: from [10.162.12.242] (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CMTnb3R3SzyZ8;
	Thu, 29 Oct 2020 16:26:59 +0100 (CET)
Subject: Re: [PATCH v2 00/46] arm64: Rework SMMUv2 support
To: Jan Kiszka <jan.kiszka@siemens.com>, Peng Fan <peng.fan@nxp.com>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
 Alice Guo <alice.guo@nxp.com>
Cc: Renato Mancuso <rmancuso@bu.edu>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
 <78334f5d-b665-8de6-31fc-10599877b3b1@siemens.com>
 <DB6PR0402MB2760F60895CFBCCAEA5F2F3A88160@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <bee3d688-1c2d-f4d8-f434-b9ff8d50ce10@siemens.com>
 <fd8fe9cc-9e69-4406-21e2-979b282b6d16@siemens.com>
 <8c0cec16-dc86-b316-ef84-af51a15c80aa@tum.de>
 <4b408440-354d-521e-0a88-e1541eaed1d7@siemens.com>
 <fa5b83f2-fa5c-e158-4b99-cc86db20ea43@tum.de>
 <eaa35809-1823-9bac-a971-12b9e4a2ec54@siemens.com>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <72e5d7a9-e647-e0c5-62a6-9572cbdeee67@tum.de>
Date: Thu, 29 Oct 2020 16:26:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <eaa35809-1823-9bac-a971-12b9e4a2ec54@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=M4BJUz2m;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

On 29/10/2020 09:53, Jan Kiszka wrote:
> On 29.10.20 09:39, Andrea Bastoni wrote:
>> On 29/10/2020 07:36, Jan Kiszka wrote:
>>> On 28.10.20 22:29, Andrea Bastoni wrote:
>>>> Hi,
>>>>
>>>> On 28/10/2020 21:14, Jan Kiszka wrote:
>>>>> On 27.10.20 10:22, Jan Kiszka wrote:
>>>>>> On 27.10.20 02:25, Peng Fan wrote:
>>>>>>> Jan,
>>>>>>>
>>>>>>>> Subject: Re: [PATCH v2 00/46] arm64: Rework SMMUv2 support
>>>>>>>>
>>>>>>>> On 14.10.20 10:28, Jan Kiszka wrote:
>>>>>>>>> Changes in v2:
>>>>>>>>>  - map 52-bit parange to 48
>>>>>>>>>
>>>>>>>>> That wasn't the plan when I started, but the more I dug into the
>>>>>>>>> details and started to understand the hardware, the more issues I
>>>>>>>>> found and the more dead code fragments from the Linux usage became
>>>>>>>> visible.
>>>>>>>>>
>>>>>>>>> Highlights of the outcome:
>>>>>>>>>  - Fix stall of SMMU due to unhandled stalled contexts (took me a while
>>>>>>>>>    to understand that...)
>>>>>>>>>  - Fix programming of CBn_TCR and TTBR
>>>>>>>>>  - Fix TLB flush on cell exit
>>>>>>>>>  - Fix bogus handling of Extended StreamID support
>>>>>>>>>  - Do not pass-through unknown streams
>>>>>>>>>  - Disable SMMU on shutdown
>>>>>>>>>  - Reassign StreamIDs to the root cell
>>>>>>>>>  - 225 insertions(+), 666 deletions(-)
>>>>>>>>>
>>>>>>>>> The code works as expected on the Ultra96-v2 here, but due to all the
>>>>>>>>> time that went into the rework, I had no chance to bring up my MX8QM
>>>>>>>>> so far. I'm fairly optimistic that things are not broken there as
>>>>>>>>> well, but if they are, bisecting should be rather simple with this
>>>>>>>>> series. So please test and review.
>>>>>>>>>
>>>>>>>>
>>>>>>>> Alice, Peng, already had a chance to review or test (ie. next)?
>>>>>>>
>>>>>>> I gave a test, sometimes I met SDHC ADMA error when
>>>>>>> `jailhouse enable imx8qm.cell`, sometimes it work well.
>>>>>>>
>>>>>>> I suspect when during jailhouse enable phase, there might be
>>>>>>> ongoing sdhc transactions not finished, not sure.
>>>>>>>
>>>>>>> I have not find time to look into details.
>>>>>>>
>>>>>>> Anyway, you could check in to master I think, we could address
>>>>>>> the issue later when I have time.
>>>>>>>
>>>>>>
>>>>>> Hmm, I would still like to understand this first... Do you have the
>>>>>> chance to bisect this effect to a commit? Otherwise, I guess I finally
>>>>>> need to get my board running.
>>>>>>
>>>>>
>>>>> It's running now (quite some effort due to the incomplete upstream state
>>>>> - e.g. upstream u-boot runs but cannot boot all downstream kernels...),
>>>>> but I wasn't able to reproduce startup issues. Shutting down Jailhouse
>>>>> often hangs, though, at least restarting does all the time. And that
>>>>> even with next. Seems we still do not properly turn off/on something here.
>>>>>
>>>>> Interestingly, this issue was not present on the zynqmp.
>>>>
>>>> On a different version of the SMMUv2 developed @ Boston University (Renato in
>>>> CC), re-using the same root page table as the cell created problems due to
>>>> different attributes (uncached) needed by some devices.
>>>
>>> Why are so many folks working downstream on such essential things? Not
>>> helpful, for everyone, even if the goal should be "only" experimental
>>> results.
>>>
>>>>
>>>>> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
>>>>> index 41c0ffb4..60743bc0 100644
>>>>> --- a/hypervisor/arch/arm64/smmu.c
>>>>> +++ b/hypervisor/arch/arm64/smmu.c
>>>>> @@ -220,6 +220,7 @@ static void arm_smmu_setup_context_bank(struct arm_smmu_device *smmu,
>>>>>         mmio_write32(cb_base + ARM_SMMU_CB_TCR, VTCR_CELL & ~TCR_RES0);
>>>>>  
>>>>>         /* TTBR0 */
>>>>> +       /* Here */
>>>>>         mmio_write64(cb_base + ARM_SMMU_CB_TTBR0,
>>>>>                      paging_hvirt2phys(cell->arch.mm.root_table) & TTBR_MASK);
>>>>
>>>> The issue in the BU version was solved by allocating a new page for this.
>>>>
>>>
>>> Only the root level? How were those entries different?
>>
>> Only the root level. IIRC, NC by default, instead of Normal.
>>
>>>> I wanted to check this effect for the version on next, but didn't find the time
>>>> to do it so far :/
>>>>
>>>
>>> How was the issue triggered?
>>
>> From the discussions I had, on the ZCU102, devices were randomly triggering
>> erros/ stopped working.
>>
> 
> I just ran a enable/disable loop aside flood-ping + dd on the Ultra96-v2
> (I would expect it to be identical to the ZCU102 in this regard), and
> that did not trigger any (visible) issues yet. I'll retry with lowering
> the enable frequency.

I extended the configuration of the zynqmp-zcu102 to use the SMMU and I've
started similar tests (enable/disable + flood ping + find /).

With the flooding ping I can regularly trigger ethernet errors in the diable ->
enable interval e.g.,:

[  373.470078] The Jailhouse was closed.
[  374.957052] macb ff0e0000.ethernet eth0: DMA bus error: HRESP not OK
[  374.966376] The Jailhouse is opening.

Maybe just outstanding transactions.

I got once an extended error that included the SD card

[  112.215426] macb ff0e0000.ethernet eth0: DMA bus error: HRESP not OK
[  112.223243] mmc0: ADMA error: 0x02000000
... full dump ...

But I cannot detect from the log if it was after the disable or while jailhouse
was enabled.

I didn't have time to debug much further. I want to double check (also with a
colleague) my current stream_id configuration because I only covered the LPD
masters and I want to check the other TBUs. (I'll post the configuration once
I've checked it.)

Thanks,
Andrea


> 
> Jan
> 
>>
>>>
>>>
>>> I made some progress meanwhile: Linux was also using the SMMU. I'll send
>>> a patch shortly that detects that, like we already in VT-d at least.
>>> Interestingly, this should have been broken on the Ultra96 as well, just
>>> didn't notice.
>>>
>>> With that, I'm running enable/disable loops now, but I lose my Ethernet
>>> link after a while. Returns after ifdown/up, and the system looks fine
>>> otherwise. Seems as if we drop transactions in the transition phase.
>>> However, a dd running in parallel was not triggering any issues.
>>>
>>> Jan
>>>
>>
> 

-- 
Thanks,
Andrea Bastoni

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/72e5d7a9-e647-e0c5-62a6-9572cbdeee67%40tum.de.
