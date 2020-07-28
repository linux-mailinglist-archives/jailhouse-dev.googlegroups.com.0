Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYEYQD4QKGQEXFOHTTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8102308AE
	for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 13:30:41 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id b13sf8740538wme.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 04:30:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595935841; cv=pass;
        d=google.com; s=arc-20160816;
        b=0hx5eDeWR4lLMfxubB/hvrVjfZtrS2ucZ3N1DQdRabp5dXosqF07K9Abz5IPTtytn1
         R+txh+DKsb1ctS6N5Tmqo5Spfqksgfda1+hu+Hg4lbSEd3YLw634yQaOPftfe39oYCiC
         Zcf+f2dWdahw5atWOso5QTST+GF8GG/Nm2QOZlQUk8tiQ2LeUj8vcYiwXgkJAWKIdUf6
         z+abFzUiWyv2W7l1dWyCEO9a9KIL6s5230zk6FcDMmhXSH/dbKbqnv4RD1nztYqGordp
         ID0+y6RMehISa91rC8xwCZRChyojksKOEcU+Q9eZpB4/z1X3m6yOlCErShTJ2mlekaJM
         d+WQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=mpEWpiHV+7UJrOMIIrNWOIH6faUl+BHwbEth6ewlmP4=;
        b=uweQv0dYZ0PIGVRD1WzPba5Tb2F9806WOJDk/uSZFo7zLVlkOmgECaCEbFLbW0GmHj
         0c53qeDQzwp0xGGyJvVV+dfHyXCaGDlAnYL9lFeXuFfYu/+nyNrBFyCCg9k/VzT5SW8Q
         qATPoNa7e6/EkkS9Yw5rqeJlk5+8v1aU8yns2du9fUBCxD9LDu7chbVZb4GLxxO+bkTY
         9zKj+V2nX6mQWhIcMJv+M0yxstaZ5rCjYKkZBeUxfK69Y761xI1/IiQAtVAztN0aG451
         D8jMBci2QlQlP2TUaJzsku6rfP8byAn59Uk+ywbKG27ARLP0ZnYNDm+b3MjObBfr9TAv
         Jcdg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=mpEWpiHV+7UJrOMIIrNWOIH6faUl+BHwbEth6ewlmP4=;
        b=im01CnokwtJd/ZgNJUSiVsx26X7PPvtRKslhKPFCbloau7jqs86tg+J+/2NAMb+IyB
         orQIgEkuj+VmqtvHiIh2d2Cm4Fq6Nt0mBKCnmBa5W5YXr/AYJ2rTadC/midiP25X07eo
         m5YhY0rrGlRD9Jzyo8fi070M1G14SDX00n7l9j5LTXTwE578L8aCXR1UfHP/IwA2t9Pa
         Gq9ZBkd5X/EHDKEeC8RrcPQhfGwxY4LcjUBeLM03e3opbqQIYa7IKfDgm87fxDOW0fn8
         RU7JYeDaxFVolCObREu3XDbuxGzLuP3MCqFl/e/QfAhdye+dvjpQzDdm5ZqOLpkkK8kF
         MrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=mpEWpiHV+7UJrOMIIrNWOIH6faUl+BHwbEth6ewlmP4=;
        b=CvdDXhV+X6+tgW55DdsXEEGCoG3eCDiyoGyOKugTVoxkDKMA40pkltR2AiSVnG1zz6
         IfbabjUlYkEZbLxO+lJsj9RjXEdf7K5EyPSkHOVrC8R5KIbnJGjVq8JCHyE8B8Z3n4Hk
         C6/wNjFAceLDLBHGFzBCFJ1H82pHdeyvuPoVb946Nhls4JFALs3/fsGhAw71t62vcldD
         LikOkAW8mdGcFxKNK5D/srCDyvA2UtnkkZIrrxp/T7e87SpeKcim+CIxxweDg2mo4fMU
         tp1jqXBsnxZmLpd5X5pCrStmlTA7W8Dlp4OqPlG5lrBHub6rKW0EH+Yhrhm2UfcQ0+/Y
         HZLg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533UVvnor4fHg65wNZWVriGgpWf+qMoKcfI7Tya9QlZapTo+uMIe
	LfHL5j5le0Tr3xbFvzDFrow=
X-Google-Smtp-Source: ABdhPJwUg5haz8ih6ypomBepaW2z3Hxvd99EPHObgfPZSYKyNYWbFZ9tBC1fVhTvAuDb174UpJ5U/w==
X-Received: by 2002:a1c:283:: with SMTP id 125mr3827376wmc.12.1595935841056;
        Tue, 28 Jul 2020 04:30:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:b1cf:: with SMTP id r15ls11965662wra.3.gmail; Tue, 28
 Jul 2020 04:30:40 -0700 (PDT)
X-Received: by 2002:adf:edd0:: with SMTP id v16mr26810501wro.271.1595935840346;
        Tue, 28 Jul 2020 04:30:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595935840; cv=none;
        d=google.com; s=arc-20160816;
        b=x7LJDxHQzMCFHecWeWUx7dL4nhXhwr8kW8UDwCZTqnJSVSPRLGqGePLdJUgAC8YlGQ
         PGuleyqiGMjRssX1ahY4gkwUqHq6YW6lJOGg0bqwXsekHuPdx3fsRK4aoFvSAoIaHnZb
         PphIba5drA1C499addhqv7TTCPBPhX5BWAxLPebrd0ODAGeIjRJjYBNG2tcJ1WOAeZKX
         4/MviBdRv2ze+GXwKVO6NttL2ryibf7Lt4cwAsO+WEF2sy3khA1I9vKYenttV2dES2qB
         1I5w8zIDPng7F+NjMd3OToR5df6sbP91BNEV8IcezFwaav0j7Gi00lQnYPmiy/xH2auW
         8Dvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=D6w1Hr720T6j4GzjLc9pN4EDYXaJvcRk36uqdHbf8AA=;
        b=0+KdkWRKPeRlhNQLrtLJs/B/scof+RcroxpLNBzVeQw9VmyNmURhojVuXg4SAenjAE
         k4p2OlJG0MUiosB88ztiBUvmTx+UcQHN1YzIXHU1mLhryy61NLrZb4o9ziKeUGXGCkQl
         M2854M+sYW0R5kzN/S/9bmQatLzpblwhSbn2LhjdqiORIOBrOeYdKmSgnt55DkuarxH+
         Qui8YEq4hb4uVpWQGoad5aOFOd7GdLfXw2gE1IvM8ukjFMvE7ar/I0sgXyxOonmaZWiX
         eJDWAqLlpXGyLPysNg5FmPb4ogHGr5dzWbEwBvBlNXrnRqXW4yojMXngHlI37MLy3I0D
         /+wg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id o134si89454wme.0.2020.07.28.04.30.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 04:30:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 06SBUdVu032046
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jul 2020 13:30:39 +0200
Received: from [167.87.93.82] ([167.87.93.82])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06SBUbMD001382;
	Tue, 28 Jul 2020 13:30:38 +0200
Subject: Re: [PATCH v2 0/9] Add cache coloring API and arm64 support
To: Marco Solieri <marco.solieri@unimore.it>
Cc: jailhouse-dev@googlegroups.com, marko.bertogna@unimore.it,
        giulioc@xilinx.com, c.scordino@huawei.com, fabio.federici@utrc.utc.com,
        Luca Miccio <206497@studenti.unimore.it>,
        Angelo Ruocco <220530@studenti.unimore.it>
References: <7fff9e0f-e13f-b41a-36c9-228e9883fa7b@siemens.com>
 <20200615081139.agyjjsccbwnsux43@carbon.xt3.it>
 <dad08183-081d-6c31-5be6-305c39a9900a@siemens.com>
 <20200720162639.jsc4o5a7nzinaxwn@carbon.xt3.it>
 <615c92ff-593f-ad69-ea87-1ad439d211e2@siemens.com>
 <76259743-55bf-4d28-f344-1d829e040d00@siemens.com>
 <20200727211308.5mxhkffz5aj27ocb@carbon.xt3.it>
 <8f358d65-eecc-405e-c659-00f501cf5040@siemens.com>
 <20200728091507.35bodtnsvbgcwxvr@carbon.xt3.it>
 <ee0c4b0a-9ea3-4978-43fd-fe38a1321e9c@siemens.com>
 <20200728110945.w4o52pgtq33ic2pv@carbon.xt3.it>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d8b12a27-69dd-e47e-a7e2-258192696bc6@siemens.com>
Date: Tue, 28 Jul 2020 13:30:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728110945.w4o52pgtq33ic2pv@carbon.xt3.it>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 28.07.20 13:09, Marco Solieri wrote:
> On Tue, Jul 28, 2020 at 11:26:45AM +0200, Jan Kiszka wrote:
>> On 28.07.20 11:15, Marco Solieri wrote:
>>> On Mon, Jul 27, 2020 at 11:39:48PM +0200, Jan Kiszka wrote:
>>>> On 27.07.20 23:13, Marco Solieri wrote:
>>>>> If we understand correctly your
>>>>> implementation, you are mapping the entire memory region and then
>>>>> copying blocks of the binary image using what you called "colored
>>>>> offset" function.  That was very similar to our first (unpublished)
>>>>> attempt to implement "colored loading", and we soon discovered it is not
>>>>> very efficient.  Loading time grows considerably and could impede
>>>>> scaling up to larger images (e.g. an Ubuntu-like rootfs).  We think that
>>>>> a better alternative is closer to what we proposed in the last patchset,
>>>>> that is:
>>>>> - create a colored mapping,
>>>>> - perform a "virtually" contiguous copy of the image.
>>>>>
>>>>> We understand that this logic has to be moved outside the hypervisor, so
>>>>> we would like to move it to the driver, exploiting Linux virtual addres
>>>>> space to create the colored mapping.  What do you think about it?
>>>>
>>>> Did you examine what was causing this slowdown? It seems highly
>>>> counter-intuitive to me, given that we are only copying from memory to
>>>> memory in 4K chunks, just using different virtual addresses - that' all.
>>>
>>> I think you are right, indeed.  Doublechecking our old (and slow)
>>> prototype, we discovered we were actually not just copying at each
>>> iteration step, but we were also been ioremapping.  That was most
>>> probably the cause of the slowdown.
>>>
>>> That leaves only a design point in favour of the contiguous virtual
>>> mapping.  It makes the implementation more robust and elegant, since it
>>> enables the copy operation to be independent from coloring and thus
>>> reusable.  This is enough for us to favour this approach.
>>>
>>
>> To my understanding, the choice is between:
>>
>> for_each_colored_chunk
>>      copy_chunk
>>
>> and
>>
>> for_each_colored_chunk
>>      remap_chunk
>> copy_whole image
>> drop_mapping
>>
>> As the first option can be reused for uncolored images as well, I do not
>> really see the value of option 2. Prove me wrong by code ;).
> 
> I see.  I would easily agree with you if we assume to use the
> `jailhouse_get_colored_offs` (or something similar), but we rather not
> do so.
> 
> Instead, the `next_colored` function should be favored as the
> fundamental coloring algorithm implementation, because it is closer to
> the hardware meaning of coloring, in the sense that it preserves the
> notion of bits in the address, instead of abstracting it away behind the
> notion of offsets in the memory space.

I disagree here. First, because this abstraction is a benefit - provided 
I didn't miss a case. And second, because the algorithm avoids the loop 
for the calculation and simplifies the loop for the virtual memory 
copying or mapping (the latter is not implemented yet, so just a claim 
of me so far).

> 
> As a by-product, the implementation is also more flexible and generic,
> since it could be applied also to different kind of coloring, e.g. to
> bank coloring.  In these cases, nasty placement of useful bits could
> make an "offset-oriented" implementation hard to read (and also very
> difficult to write :-P).  E.g., consider a case where only 12 and 14
> need to be used for a 4-colors platform configuration.
> 

If you can point out concrete platforms/SoCs with such properties, it 
would help finding the best solution. I dislike design decisions that 
are based on speculation what could come. Usually, they take costs for 
"extensibility", and the outcome will still have to be adjusted when the 
real use case comes along.

How did FreeBSB - or what BSD was it? - model coloring? Any other 
reference that may have worked on more that one board?

> 
> Beside the "offset vs next_col" choice.  We would like to stress that we
> need it to be aligned with the concept of colored memory that we are
> proposing in v2.  This notion is present: in the user configuration and
> documentation, and also in the hypervisor code.  Namely, given a color
> assignment, a memory region, and a size, we want to map *only* the
> needed pages that satisfy the size request.  I.e., not to assign *all*
> the pages of the given colors within the given region, possibly
> exceeding the size request.  In other words, the size parameter is meant
> as the real size to be mapped, not the place where the find it.

I didn't finish that part either: I also believe that "size" of a region 
should reflect the physical size, not the virtually expanded one. That 
virtual size makes it really hard to read configurations now. Yes, there 
can be tooling (config checker), but when you start to rearrange regions 
you will continuously run into those overlap issues because region do 
not really end where phys_start+size suggests.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d8b12a27-69dd-e47e-a7e2-258192696bc6%40siemens.com.
