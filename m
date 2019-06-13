Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7PNQ7UAKGQEQ76OE5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A9F43316
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 09:10:55 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id t76sf1477880wmt.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 00:10:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560409853; cv=pass;
        d=google.com; s=arc-20160816;
        b=DKFO7g+RNYtVViB/1IhGuCrZJoHAnuTyP3AtGpNIkCLl4N5DhMimU755k3GJ/ReZQv
         oiLy1FwQ73qCSVWEpgnsWNtGZHGGrziUs+T4H1N9QbJ4e9H9rgalC+LqxXidY1WkB3kK
         N+KKc15Q8+SZ1dLLirV3k97AY8ANJR4pmcuPiV6ORnOTP6VEP5YJqtA935533gcZawkE
         VQOwy7F1Pd134xo72iroP9EIRU5Mt6pde3eTJqe28LB+HGEDDL63g3ntt2UVXolGLRNZ
         UkNOyOrNCIiixHGNxE7q4Lh9//gy3Am3PUDx8P/Rd28x+AFSxMHBq8Pq8Ok4mvY/qjN/
         9eGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=335UboXLiJtuYQqH/8y8Qcqw9Z7mTvCO6rZCWbcaG3Y=;
        b=wKNHNT0hPXLOn1tgsI6K1GP/cNqgwR+ROx6H8xzA2fJzIDtDqLtfJ9LGC3Eie3XRNX
         ou1fMlCDxkGrme8lzWcMKfwMZY2VDcmJzUmugM48MUJNHe9uNLTp91BbXiMG2TwtuXy6
         kEZ91US3HDkSni97E/zYeVnEyrSRSGUGciWVbjLuIBbeOoIt1X0nstbvGnfJYL2JvmLn
         7qxB6fOWzBpmDRu5Q9rbNRFlT8rblaCvUVgQ05bJryYNIAMZ2Mfu4rZKT3qmtAtynAjF
         RH9EZyDH1oDkIQdKXhRciiwe0IRpbhoSbIEzAvEcjcpyxcdJAeDqmc/NrrM+kLTPWjzo
         Ob4g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=335UboXLiJtuYQqH/8y8Qcqw9Z7mTvCO6rZCWbcaG3Y=;
        b=OTpFEaQujaPjLEjNAZ123rwXPI0rSNeywWLMSbcgqoK56hf7WLFbgrS1/h9RyDiuvM
         c2G0BSDskZSyrgL0Jlg0K0TNuFXDuuSHIfyKkmUdOAnBcAJRAuCmeq8KYV43oSyySGcf
         sAtUEjZzIOAyvEvcdzkYJKlVOVAwRfV05zibtRG/iTw2anP0C/syorxW5TEPehe75PQk
         w0jG83g1R8TIBAso/xFX77LdX8ijA6lq9Ne2jCd1w3DM9+LhbxQLcF0LjIXt0oYR11ZY
         SrLPKVDDsfvGRYFBg4uG0Kon5pjizINtQdPxiplXNKXMDOP07LI8TVBPK2IS5pgauT2A
         dy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=335UboXLiJtuYQqH/8y8Qcqw9Z7mTvCO6rZCWbcaG3Y=;
        b=SwPfHK0c1dcYkTL9KM/4/MB7rbomt9gbxBOr3wwjR3FqwDF+wP93efxDk5RKSxerUt
         vZsvsnPW5rDMv6B1BdU1UyX6f6qaU5vQKs4TmsSi0vJSKgWNvy78It9LEeGbtVi9Uepr
         5lcCSZLlyfPslp3qcWOZD7RcTdWZHkWGqwQut0GGUErcR9ale8r4a8qFs/aOq2xEyqOg
         iZiY0JMdNoyVlJYK+GafJ+F5WCGwUDaBU9AjxVEv2Hgof1rRhf4A6gpqfN8z63FBexzP
         hJ/5BcBXXbjPDOpmVUCIehWdMYzoYvlX1+tlV2UFj4kHPMIszA2PuizIfXBrtdtoCqKa
         pHDg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVpZ71ZZgYt6jqwEyZsT9nyiAdKj5oBp50IJ44AehThMsLgEJTz
	8ELPVar9o0xQ6GqCgJdYnF0=
X-Google-Smtp-Source: APXvYqyOudKX+9drJSCFX0gjNJr7m4to61ngwfbt3tNZwGf3RPlPwpzgMyPgYYtqegPw/wUtpDxqPg==
X-Received: by 2002:adf:ea88:: with SMTP id s8mr42053989wrm.68.1560409853651;
        Thu, 13 Jun 2019 00:10:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:bacb:: with SMTP id w11ls1087495wrg.9.gmail; Thu, 13 Jun
 2019 00:10:53 -0700 (PDT)
X-Received: by 2002:adf:f68f:: with SMTP id v15mr7881129wrp.4.1560409853014;
        Thu, 13 Jun 2019 00:10:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560409853; cv=none;
        d=google.com; s=arc-20160816;
        b=GGfRTM+jbEWrBqRQzUCjoe7Fnw2GxNLKiHb+pHkOh3Cq5TRcWRC32VuZN9GJL33TX7
         LqaVS5pSWTZCJ1AHpOaUGZEvmukdpJMeOgcZ6MQmuijNF7A6KS2Wyrt5F/uvyMuK8igq
         0VtCdA99fR+1i5X7AX9CbeMMUPM3GeAPoLCX57QL1v8BqkaiRo1e/7K7q8NI7IFASwJv
         iEmtycSSFCXiKfm+FPrA8Pv6jJX9qPlWeo269E2aeaX+aUUKzZ08UWyKtw/JvNpU/dQv
         +3PShSuZ5AMSpgRAm5GaGXUpZEzS8pw2/yiU+hOQ5NeouvQQ7QgNfoYam48tzr2Xi5Ba
         qJIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=mtfv+KCZQvSsR/e1+lAB0EeW1U3w1aoCfMmYkIphNwg=;
        b=YNBxK5lZNoyggFU95OzTfMVDajwGbCM06wW1cNuvmqCnAWAkw0ixDVgLOFCBUV2jsv
         b+Lixunh76ZNV4jqBiOBh9NNm4AY+I2VQm7HsURbvuzeIZxA3zZfN+et/lwoXP7BlWlb
         btuEtzJFQFoN3rS2GCV47rZjV794jiAl+Dd0hx3eNTn/b2eqPHeukkU0HhM6fsmyKPEH
         q7mkMotmFkLRgcbY7oUTQ62jL5lxwxO6AJkgsSKNi3XWvpQ2DFBiLrdp/qh47Pz+DUwD
         ldOzc7eInUyjWEkeCUpkGt51WIt99nnFSu1mr4Oh264mQM89cCjOUfd3J3UUPLMP1q+/
         OQyg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id u18si73608wrn.5.2019.06.13.00.10.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 00:10:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x5D7AqR0028680
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Jun 2019 09:10:52 +0200
Received: from [139.22.42.197] ([139.22.42.197])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5D7Aoe0021776;
	Thu, 13 Jun 2019 09:10:50 +0200
Subject: Re: [EXTERNAL] Re: porting am57xx jailhouse support to v0.10 version
To: Vitaly Andrianov <vitalya@ti.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <2f1c216b-71a5-5a78-79f5-416b11539d81@ti.com>
 <ace421df-a519-4509-2b97-6713009b85b9@oth-regensburg.de>
 <27491b3c-0b03-0ba4-da94-6a8cadb28006@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <08040698-56dd-033b-2481-45ec158f6030@siemens.com>
Date: Thu, 13 Jun 2019 09:10:50 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <27491b3c-0b03-0ba4-da94-6a8cadb28006@ti.com>
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

On 12.06.19 21:27, 'Vitaly Andrianov' via Jailhouse wrote:
> Hi Ralf,
> Thanks you for the quick response.
> 
> On 06/12/2019 03:12 PM, Ralf Ramsauer wrote:
>> Hi Vitaly,
>>
>> On 6/12/19 8:45 PM, Vitaly Andrianov wrote:
>>> Hi Jan, Ralf,
>>>
>>> More than a year ago I was working on Jailhouse support for TI AM572x
>>> SOC. That time we used v0.8 and everything worked fine. Presently I
>>> started to port that support to v0.10 version and found a lot of new
>>> features. The mane "feature" that you removed "mach-..." and introduced
>>> "units". Because am57xx requires to have custom init and cell exit
>>> functions I think I need to create am57xx unit.
>>
>> Hehe, upstream first! :)
> 
> I will as soon as I get it working. I don't want to do porting work for every 
> new version :)
> 

At this chance, I would like to remind that the CPU wakeup hack I once provided 
to you should be cleaned up as well. It worked back then, but I can't imagine it 
was properly isolating the hypervisor from a guest. Or did you improve that already?

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/08040698-56dd-033b-2481-45ec158f6030%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
