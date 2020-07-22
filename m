Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQPO4H4AKGQEAORYKDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 59916229E83
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Jul 2020 19:28:34 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id h2sf374378lji.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Jul 2020 10:28:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595438914; cv=pass;
        d=google.com; s=arc-20160816;
        b=O+xfBneHL4J8bkYQg3tyVWFoXWiGyTM+ue6HiJ8J1Axm6LmXbsP/VxNUO2JpnC+ZdT
         dvowdDrjgffeNsIK1extWZGKHlf/H4/BUIAGc8ruENy5UBr5O0Q2PM0jo85PUCcY+Iwt
         u+X+Q88+pk9djB5aoNiyo2OWSGgA3mPOVEk7R2IGsYi8hO2ndY6x1SiqDxUzcIbj6zPZ
         niaIJplUXlH4RFjl6Oyb4juqlejevYAJoZQmxkuQa6OC+7CFIenvLcOLZjwcEDrmTDcE
         lByM6S7e03T8dtxeupIkYoBl/CcQwLLMHKCw13GrgG5XdbOt2IlEsneO2ueBrMm3tXD4
         a25w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=AmyQ8jkpoIGJtyLyCobFnJVjbtPNL8M3eK4KKP8Ar/k=;
        b=hNprsf05ymWkVub16BSxrSPiwLHpP5ABroY9588M46/e/rJm8sps6EIW1gDXdMqGk4
         yeJ2iSMTdmFI8UmAu+ubQy4mCQXdiW7wMsyUhcU7NI1QnAKbAUJySTh3Xx/EGCDDEK7v
         6Y2xxWcbIm+Uz3Dpgg5YA7Znv9o0JED8eOze83pXhAeUfZ48iyeef/nlSd5p6YHY01rM
         XfBt4Ukon50BA7As35S1VQUaKmV/vR5eEryrSK70hDthN4RVdifnONWI/pXPoqbpYZvL
         tJNSkdmPMnK1XM1ooWLXJgGh5O/gFRxyNmOtaz/L20A5e+637jpsRFg97defJRMwz5Ev
         aoZQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=AmyQ8jkpoIGJtyLyCobFnJVjbtPNL8M3eK4KKP8Ar/k=;
        b=oJ9DQ3mZHf394vN2qkgY5YnTCmE48Ko+6hUDYUeJX7glmogPfGAUVnRN/ZP+nZvRVP
         pd012G6RnclYlkvCDo4Jg9YNrnDi2ODzGswRQag3ybuX5hxXz5dfhBaZzCY4ZnSRU4Qr
         zhFfuCvm/UJFJe15xK8++CyiRXGuE/5pwpna7jYpKMWgbrm/x2pRDOcax8rNPdyxF1Iu
         yzYtwkkJ6Hfn/udxHwM0fs6G1QdC7kELU8FubgfI9Omqn7REDKDaYh/kQ7gnjElLUxFH
         HVdUTWBnv+7VMt0cSbW8xTHl0h5JNyHhgb6k14ib0MNTUNTOc5eH2NqLHkHfupXC1BSx
         6c7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=AmyQ8jkpoIGJtyLyCobFnJVjbtPNL8M3eK4KKP8Ar/k=;
        b=ChkQ2VKrghh7DJtOqDWFsR6jE8lWKYD9n1Aubp467/G9ww6n5+sTqVN7I5XQgdaO5v
         TxfijrGOecGhQmXQbjhkDOD0CC8Hgsi2ATEMhRya3nSog7Mx/F1137P8uq+I3cDDzi9h
         cyndzj+9w2Jiv1FQZYf4l2A+/1GqtgJMHddiZ70XQOY2gSv7olK7SzEbAaQqZcW0rbDV
         6G8MbxJVTzMKLFeW9uK5kf06XoZXxKV985cqLNu1L5xs83x2ctD+KaVDrsibAzmScuZv
         rXFChSi8M31pQ7AG7JULuM/g2vUUpPcHdJ6lVl7cpwGU5K7N6JXrCKOHbgiYNZPhp5KV
         Iy2g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530yKbjfP4VhtJY6CDSmmO03X5GRlu9Tcye+WEE1SGD1ig4qH1nf
	cRnIRiocAR7zeWWWc+QNn8I=
X-Google-Smtp-Source: ABdhPJwAg091fhv9MLRqfROJIa8Hz/GlZX2di3qoxyCcTzGpag1Nq3uP+2u2xsP36ccKhDKbH+MVxg==
X-Received: by 2002:a2e:6c0d:: with SMTP id h13mr126800ljc.394.1595438913897;
        Wed, 22 Jul 2020 10:28:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:81c4:: with SMTP id s4ls562595ljg.10.gmail; Wed, 22 Jul
 2020 10:28:33 -0700 (PDT)
X-Received: by 2002:a2e:9017:: with SMTP id h23mr134773ljg.61.1595438912969;
        Wed, 22 Jul 2020 10:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595438912; cv=none;
        d=google.com; s=arc-20160816;
        b=KxxTDMs4PXyhZ6RdKgj8Wuv9AzkZBkew+9NmFUdLUZ2plyfk9lugGEn4sscaKzxPM4
         9y6lWrE+YlMJZb7CqKBwdb00RgXhBhmouOB7iJOM91TVoaJUJEzqnuG8L2V3crWSxFlL
         g6K5Jk3coyY23TsNwZ6X4niJ7EXg9Om1LLMk2XwK4j87dQmlmffexmbbJ+Ae4Yw+rXV2
         LN3+X/5OcIKm2lHnkMksEz4ijUTGSWGpnaCC/Y5Yk91ayY+bY5pUraukLebqKUhqfblB
         P4BXOeaGhMbTge7Q1MnSVJlJbBTY9JJMDppkeFLJrd0DIjFTcACo9STgbg+/CYeunoO2
         qxnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=lVrVd8F1+L/E1Udq5Ozbfwb5UvhI0O+TJlG2XXO3Szk=;
        b=kg9rFu4k2rL/IebIE7yXKPdZ1XxBeVliN+l9SwOLPZfcgswh9OxfLKaYmfb1tKS8Mu
         ioTWS885xWw4dJYdKyxFtAjQQzTCJ76nQwZsah0kabhLqsxaduclql4WYsmLW/+pjm8u
         JcrW51WtKX9lPSeVJSX7DNtItdqvt+B32AcCdUvW6cFmfVXh74l54YpAWOn/f0AsyuEi
         Qmc7UaVMVc/7dynM2Nfh82XfbuoF9V19vzm+wWEN2l/u961RfivyoR5ld079HnhdCL/5
         zykn6zIM3RtFSFHlPeu390wxcbrCR+QHKEgMDAPqV4amClaUlAZ8RfChLd1s+fR95MXW
         lcww==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id s3si24700lfc.2.2020.07.22.10.28.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Jul 2020 10:28:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 06MHSVoh009843
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jul 2020 19:28:31 +0200
Received: from [167.87.88.27] ([167.87.88.27])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06MHSTH9010371;
	Wed, 22 Jul 2020 19:28:30 +0200
Subject: Re: [PATCH v2 0/9] Add cache coloring API and arm64 support
To: Marco Solieri <marco.solieri@unimore.it>
Cc: jailhouse-dev@googlegroups.com, marko.bertogna@unimore.it,
        tomasz.kloda@unimore.it, giulioc@xilinx.com, c.scordino@huawei.com,
        fabio.federici@utrc.utc.com, Luca Miccio <206497@studenti.unimore.it>,
        Angelo Ruocco <220530@studenti.unimore.it>
References: <9605c893-d940-ce35-8301-832d31382c88@siemens.com>
 <c25b626d-2aab-2ccd-f129-40e8b525a232@siemens.com>
 <20200526132429.bmhnaiug7ssblxty@carbon.xt3.it>
 <7fff9e0f-e13f-b41a-36c9-228e9883fa7b@siemens.com>
 <20200615081139.agyjjsccbwnsux43@carbon.xt3.it>
 <dad08183-081d-6c31-5be6-305c39a9900a@siemens.com>
 <20200720162639.jsc4o5a7nzinaxwn@carbon.xt3.it>
 <615c92ff-593f-ad69-ea87-1ad439d211e2@siemens.com>
 <20200722142016.zokufzzm63ly2oo5@carbon.xt3.it>
 <5a66e10a-6215-9c1e-241b-7cab268731c1@siemens.com>
 <20200722164256.n4c43mf7rrt6lzp2@carbon.xt3.it>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d60bd3f8-9a0b-eaf6-8bc1-7a544daa60c0@siemens.com>
Date: Wed, 22 Jul 2020 19:28:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722164256.n4c43mf7rrt6lzp2@carbon.xt3.it>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 22.07.20 18:42, Marco Solieri wrote:
> On Wed, Jul 22, 2020 at 04:39:59PM +0200, Jan Kiszka wrote:
>> On 22.07.20 16:20, Marco Solieri wrote:
>>> On Mon, Jul 20, 2020 at 11:29:21PM +0200, Jan Kiszka wrote:
>>>> Regarding dynamic coloring, I can only repeat what I stated before,
>>>> multiple times: I'm extremely pessimistic that you can turn on or
>>>> reconfigure an IOMMU while you may have transactions in flight that are
>>>> affected by that change. How to collect the pieces when you do not know
>>>> if a transaction finished and which address it hit, the one before or
>>>> after the change? That is exactly the scenario when trying to move a
>>>> root cell from uncolored to colored memory. IOW: You may implement this
>>>> but you cannot make it robust.
>>>>
>>>> A more promising path is pre-linux Jailhouse boot, maybe even without
>>>> root cells after that at all (needed anyway for shrinking the runtime
>>>> code further).
>>>
>>> This time, let me try to dig a little further on this point.
>>>
>>>   From a purely technical standpoint, having coloring implemented in the
>>> pre-Linux root-cell loader is of course a more proper way to implement
>>> the feature, by far.
>>>
>>> On the other hand, I see two major drawbacks: one on the
>>> software engineering level, and one in the product management one.
>>>
>>> - AFAIK, pre-Linux Jailhouse boot is not only highly-experimental and
>>>     immature, but also an inherently optional.  This means that it could
>>>     be dropped anytime, or that boot support could be missing for any of
>>>     the supported hw combinations (with ordinary Linux boot).  This would
>>>     therefore place coloring in a very weak spot, its solidity depending
>>>     on another optional feature.
>>>
>>> - Maintaining boot support for all the hw combination one needs to have
>>>     cache coloring support available is costly.  (I bet you know very
>>>     well, Jan, given that you placed the Jailhouse project on the
>>>     Linux-boot design cornestone.)  It is hard to imagine board/chip
>>>     makers widely embracing, contributing and maintaining pre-Linux boot
>>>     feature for their products.  This means such a cost will fall on the
>>>     Jailhouse integrators who wants to use coloring.
>>>
>>
>> I don't disagree that we are close to having pre-linux boot ready.
>> However, neither do we have a sound concept for post-boot Linux
>> coloring. Morever, pre-Linux boot has the potential to further reduce
>> the critical runtime code size of Jailhouse, and if that turns out to
>> be true, it will become a first-class feature of Jailhouse, you can be
>> sure.
> 
> What you say is true and also very important, I believe. But is waiting
> for a proper solution worth? Or is it better to bring forward the
> availability of a complete coloring solution?
> 

If you can prove my concerns wrong that I have about live-migrating DMA 
transfers from 1:1 to colored, we can try coloring the root cell. But I 
haven't seen any concrete resonsoe on them, although I keep on pointing 
that out over and over again.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d60bd3f8-9a0b-eaf6-8bc1-7a544daa60c0%40siemens.com.
