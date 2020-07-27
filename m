Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKET7X4AKGQEISONO2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFC022FB8D
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 23:39:53 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id 196sf4811098lfe.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 14:39:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595885993; cv=pass;
        d=google.com; s=arc-20160816;
        b=q1qG5qvm1Wr0NwZSA5MtqLf/7DOyCkQnI+0/yY70Q4iQKigMeFJ4t6go42iZ0u2L9e
         4T8FYpe4Z6qIz8zR9FTZDi2TM3Ix0geZZ5UqbR3ZlLJVA1WQZ0Dye5uc6gjwmphyC9Ce
         NhJvHEJVpJ609fxjcMJACmEnAFjx3e7gXHwsIrkd0xbqYDlQWN/JHQ0MOKHxxcAyRGvL
         YqMs2TtW4o2IDj1N93o3TeCJgKEpo/x7JE6KrhHnFC0RvR0ObdwMalbLcWw+GXItDTaN
         pgJOT0bPmO+z0GoruewJG2UQrPzGX8JzgCw/yZdGy0wCYPhQh1+l5c9WxNR74Rtq9AMK
         HxNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=musHT36MpNGyIRIhaeL+/Tl2fhS5kmKSgg24JnIBpgg=;
        b=NB4Ry33o5AiXyLWesQdhgjHgLeeMsorI5f5fWb0lrW6hZmOwb0yotAShFrULfIVqGP
         /2XwlKaLHoWK13gS+/aDDW4EtKGHP14dRH6DNruQrvif7TbZvv/2VZzVaFxQyKeG/EbD
         F7uHstwNp5XxxtBhzST0onhYk//6oOiS9N1wVe6x7SIV5SMDPfwl6SXeiouo+T51oBfK
         sKblPKWsZ0RpsLBRqLjVmdkNTLfO/1+V6V2iswMW46xn9Cz+bPjZ/7o9JYkIHrfGvnub
         miwxqr5Z3qbP2yxIqNRMjRuCOcuXghkJ2tL2bqSReiSybdnNR+EbTtRNfWv0wp+W3hBI
         DrjA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=musHT36MpNGyIRIhaeL+/Tl2fhS5kmKSgg24JnIBpgg=;
        b=iH3oOM+SzT9gVsG8vOA6tAfyyaEULTXCTeegMsHdGe9i+IDBklIBujJe7cJ5ta6qxe
         1pPbbuayaH8RXEBBdZDLb/vxafniHZ8h9WfjH89N4ocx494yvVUlfdDaET69c2dL6Sa3
         GAuPwlPXIOmn9vzP6vDt7ALCCiCknrL7IgLMKRQ5nEAMpv8S+UQjqpJr0WDSX+8iBJjO
         bjCj29mLQvvvx1iNrRDypi8Wzxecj/Dhh7T95MIvdWjGG+bpiowflH/5wqyFcM9ps5GE
         aUmmvr6HphtwblRzYd1yZYgxJGpbFRgm9LFTmUWsrbn52pbwbwqrbDS9S6DzOE20tJ7u
         MSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=musHT36MpNGyIRIhaeL+/Tl2fhS5kmKSgg24JnIBpgg=;
        b=VKjjBQ+qSDkcGMDlR0JGJXN13l+2Vq9niP/gB1XKWQQbH1fvRZpW21FV53V4kvtrEc
         z/BGYzeFqQr7qFwxfp+5dAPa0g0kOU51djl67bPeDlTJ5gEuQcNBeufLa8m5TfC758Ty
         hHd7JFPnOBdSRuihvJRrHAQIz1Du/w5wnkdAPoG98DDfwCE1r2zzw0kMK0AllhyqrWDT
         CXUbELz4tPYYnSJGKycQVLX22FxNCz6LexF23un4EpwcHNQDOSNmmSu+f+29Cla2NkUA
         jKG/Q3M8Kw4H4fpcDd86Bvbj789rYmX1YsEKW3QsC5D81jIjEbdI3gSCxEAOwwM4qTgI
         f+5A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533lRbJaXx322UQQ55CoAdzeIDQu6WFiEUUJiVD0oakfmdJPLjVg
	nc1Yy5w0OqlA4SuHtE2ThK8=
X-Google-Smtp-Source: ABdhPJw1+IR9c7tovatuhqWxt6fG1IZjBbleXBwAbvzmnTcDconZgbCpwcUBE1NhEcpsov0ueZALKg==
X-Received: by 2002:ac2:51ac:: with SMTP id f12mr12644548lfk.6.1595885992682;
        Mon, 27 Jul 2020 14:39:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9b09:: with SMTP id u9ls3246462lji.3.gmail; Mon, 27 Jul
 2020 14:39:51 -0700 (PDT)
X-Received: by 2002:a2e:981a:: with SMTP id a26mr11259217ljj.337.1595885991709;
        Mon, 27 Jul 2020 14:39:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595885991; cv=none;
        d=google.com; s=arc-20160816;
        b=ZTsyTDiKwLyanzVtp3ueYRMZl2X7AnObD8emVImHfRhzdBHZx4z5IOwT1TOa3MRuk0
         R0B+tSVDfXpDWHgzmNE1poq8b/k/oD/AiGfAbFw5dvcNE898YwqUJyTuKloxnt+A53gi
         ioE+s3zl4vPbh0zXaKOrQiabGiccG0UY4m/mKlpIyxD4RWCyG+NyglY7+qqgjiZBIFzr
         DxCJzy1DTrxWwk0GtMZdJH1TiB93aB4g+1PCKq9geWsa9oWkb3AHgmNTCmvhyRxoX+TA
         QQOVG+GBtA4Jq6lPfBK21bAy29Iq3zS7+BZUnm4mUEjANA8+ALloeB3aHjCWpmKI0LkT
         jWlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=xOkGAhmiyNtkf6fOAJrotOq3q0D9fHjdu9JQu7ZHjJo=;
        b=CT1N5GZwp14c8Kb15A+UtOtSufuE7lzpR2GDrT7jUckz7LE/xASsbw+9JG9fzwaakc
         5VaCVmVvCXIrxUmG4dGnzMNrWFt4M3OLNNgznNIXuVnYqsAiT1vnrcX1AVcG2qHkWF+Z
         uJ2lXv1c8B22W6WBJRT7t/7IR1Np9ouG7FYBaPGEubinzi7Fi6cpBFgUZIP0t+mOY3Ds
         lI3XNikkucU58ARcB1X96EOd6n3fYCiUD9ibaMmvPBQD7ht+CXpwxsfjkY//FuQZL7EC
         Wh4j3qUP2unMIuErtuDuai30vBWei0Q3eqoaSChUpLSDnN6jFwA+WYktT1BHzcE0IGKq
         aQIg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id q26si554797ljg.1.2020.07.27.14.39.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jul 2020 14:39:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 06RLdntS004558
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jul 2020 23:39:50 +0200
Received: from [167.87.246.21] ([167.87.246.21])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06RLdmhJ027125;
	Mon, 27 Jul 2020 23:39:48 +0200
Subject: Re: [PATCH v2 0/9] Add cache coloring API and arm64 support
To: Marco Solieri <marco.solieri@unimore.it>
Cc: jailhouse-dev@googlegroups.com, marko.bertogna@unimore.it,
        giulioc@xilinx.com, c.scordino@huawei.com, fabio.federici@utrc.utc.com,
        Luca Miccio <206497@studenti.unimore.it>,
        Angelo Ruocco <220530@studenti.unimore.it>
References: <20200422072259.sc2au24ksnt6j7jy@carbon.xt3.it>
 <9605c893-d940-ce35-8301-832d31382c88@siemens.com>
 <c25b626d-2aab-2ccd-f129-40e8b525a232@siemens.com>
 <20200526132429.bmhnaiug7ssblxty@carbon.xt3.it>
 <7fff9e0f-e13f-b41a-36c9-228e9883fa7b@siemens.com>
 <20200615081139.agyjjsccbwnsux43@carbon.xt3.it>
 <dad08183-081d-6c31-5be6-305c39a9900a@siemens.com>
 <20200720162639.jsc4o5a7nzinaxwn@carbon.xt3.it>
 <615c92ff-593f-ad69-ea87-1ad439d211e2@siemens.com>
 <76259743-55bf-4d28-f344-1d829e040d00@siemens.com>
 <20200727211308.5mxhkffz5aj27ocb@carbon.xt3.it>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <8f358d65-eecc-405e-c659-00f501cf5040@siemens.com>
Date: Mon, 27 Jul 2020 23:39:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727211308.5mxhkffz5aj27ocb@carbon.xt3.it>
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

On 27.07.20 23:13, Marco Solieri wrote:
> On Tue, Jul 21, 2020 at 10:15:57PM +0200, Jan Kiszka wrote:
>> I've pushed wip/cache-coloring, consisting of your rebased patches plus a
>> hack commit that does not work as-is (maybe just the qemu configs, maybe
>> more) but hopefully gives an idea where I'd like to go for Jailhouse:
>> minimal runtime, most offline or in the driver.
> 
> Thank you for the patch -- it really helped us to understand your point
> of view w.r.t what needs to be put in the hypervisor and what not (and
> maybe moved to the driver).
> 
> As previously stated, our next proposal will surely follow most of your
> approach: minimal coloring logic in the hypervisor, mainly for the
> mapping management (creation, load and destroy).
> 
> Regarding the hypervisor, we would move most of the initialization logic
> to the driver.
> - Cache probe function.  We already tested it and it works as expected.
> - Initialization routines.  Performed by the driver, during enable we
>    send to the hypervisor all the information it needs to use the
>    coloring function.  Moreover, all the coloring logic for
>    "root_cell_management" would be dropped out (just as you did in the
>    patch).
> 
> Besides the initialization part, the driver would also handle the
> colored images' loading.  If we understand correctly your
> implementation, you are mapping the entire memory region and then
> copying blocks of the binary image using what you called "colored
> offset" function.  That was very similar to our first (unpublished)
> attempt to implement "colored loading", and we soon discovered it is not
> very efficient.  Loading time grows considerably and could impede
> scaling up to larger images (e.g. an Ubuntu-like rootfs).  We think that
> a better alternative is closer to what we proposed in the last patchset,
> that is:
> - create a colored mapping,
> - perform a "virtually" contiguous copy of the image.
> 
> We understand that this logic has to be moved outside the hypervisor, so
> we would like to move it to the driver, exploiting Linux virtual addres
> space to create the colored mapping.  What do you think about it?

Did you examine what was causing this slowdown? It seems highly 
counter-intuitive to me, given that we are only copying from memory to 
memory in 4K chunks, just using different virtual addresses - that' all.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8f358d65-eecc-405e-c659-00f501cf5040%40siemens.com.
