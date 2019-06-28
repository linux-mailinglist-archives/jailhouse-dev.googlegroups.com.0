Return-Path: <jailhouse-dev+bncBC33JYE2XMMRB45X3DUAKGQE6JBOR4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53f.google.com (mail-pg1-x53f.google.com [IPv6:2607:f8b0:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id E197F59D41
	for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Jun 2019 15:53:56 +0200 (CEST)
Received: by mail-pg1-x53f.google.com with SMTP id a21sf3218472pgh.11
        for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Jun 2019 06:53:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561730035; cv=pass;
        d=google.com; s=arc-20160816;
        b=fAEAZQut9WFX6YLEtagYE4HHLvyZQvnapDdP/S+I+MdFzIOrw5u6qHxyFjpZDxSvF8
         RTM3zNpbwHy7xpANmQWrdWairVpvq1Pzrj4gXZtRmndZpa1wwJjy3MhlxmBDq/fBLqrB
         MTDkxIuuF4NBRr/uoN6tAIAtHrAewpvAum2jvxZSYqrdM1hoWH+1tm8Z6+7kw+HuOi8w
         2pXjcxFtDxWzpgmUooBXCTT80lxdZe3BKMgxBzDxC575S9IzZWF+88/uztjxFkRcgD9a
         XcVHb68aO1HV8g7DcUilGM/sj96tEsj8W4w03A9eGXhKsNBhG1nX/lzRF9olcxySww1Q
         TyFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject:dkim-signature;
        bh=FBQbLOsfIhtNxziubKDJ4PxhySxEGOvl1+Z93cy+Jig=;
        b=esy2j6UDF3eY8Y7SNn6j7YMb2LPXFUghgdVOK03Fr/w44wu/hK9B0RTl6uUYjzpSjO
         uWIgAc8/gr0giQMi+5jvBLpdiNZR/q7rvH5FccuH04q7V6iQuNVxPCPWz2eq3xlFALLw
         sO+uspSpTfbF9fLhYWeldN1vDNCY/onNDWn1kmiq5gOyjUMuZ2ruFMiZI574yOMlR0hO
         GpsuiIwk5H7cjEUIXlI+4S9zmyFrnq4tt+t33D1D+TXpRQcrpu+hiVs0p9RHWGr09Mkf
         isoLd8s0SfwRMd4xxZ3d8gvtr6/TwZMZcHcmVJFWEndHHp0yAt2WgxTGJJul9nTSNiQv
         zCBw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=I99dEJgh;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=FBQbLOsfIhtNxziubKDJ4PxhySxEGOvl1+Z93cy+Jig=;
        b=BXel7ysqBn3a6rikbLTnbzaFTBKAPbI6KvsKN1uMCp7BMYQKGYaNd5e3NHWdyNTMXz
         8DTVjqNGVY15T1xTWyd8PqejjAvnAJc5ahQzlo6bLTK2kdRjUk+EeTjlgQ78bzui1mBg
         BmmUlmksqeQgO7dO/C10Rd2ZzaaRflYyZDsH6JXgN090H29qsrVVGLhP6xOrRM8C7jku
         9NVvSjXCecbx9K0Hqy9CodK7T8RCPB6IDpQjYHty3YT/DHJmHXJT5o8FiRhnDJl+Q4LT
         YDIjb6FTWcDG6C8QAWyvKh0RGB14hjP0BDR5iSn6i6X2HPXGH2Z2KATMb9qbEkqbJ9uw
         QEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FBQbLOsfIhtNxziubKDJ4PxhySxEGOvl1+Z93cy+Jig=;
        b=rLzI4spLE5DdHE/dMiIU+ZSeO9Qw2OqIHQKDYMUaEjRrtGyL5FVezv/UwYVm4qaeqE
         5kXMrB6irVSX6gtboliYPB/A/o4+WCtH874gmV1FHoQF7nO/cUjFI7sxN4uknJ7aSqSL
         Dv8OSMDAARNVRTSmzmqnVryGAn+51Xr4DHeppNVv2cc+oyQ/WBuQiNXUlz92RtljkQ4P
         kS/0pI8S6OyXbCPbA7EEJeaPB8+iXOmacAezGY3vQSQSPsSDYigL1gClzjP0AbUNbVhT
         CtE4+oxpSsA2n3jecQqbhjq+YQImUhSBQVunw32+ypC4RBbCfQNHiFxJM+sSCO7txzmO
         UIng==
X-Gm-Message-State: APjAAAWXRd6+ZrRPnS0F3XtgWJpdOf53vvNOUXh/tFpKIUB6QtvU6sI2
	zjEqWwpgeIb4SCcJCwO+FfA=
X-Google-Smtp-Source: APXvYqw4GNp2fPNcnN/SXtkIbzKOpR4AMfn5QkSgpMn1GREHPWGyuXOH4lOZQYUiel3SeZ3x1cvjjA==
X-Received: by 2002:a63:c0e:: with SMTP id b14mr9429459pgl.4.1561730035259;
        Fri, 28 Jun 2019 06:53:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:52d2:: with SMTP id g201ls483358pfb.9.gmail; Fri, 28 Jun
 2019 06:53:54 -0700 (PDT)
X-Received: by 2002:a63:f807:: with SMTP id n7mr9790106pgh.119.1561730034632;
        Fri, 28 Jun 2019 06:53:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561730034; cv=none;
        d=google.com; s=arc-20160816;
        b=bxv571mzqR6vPJrz/uv73Hem55hVBs3+CNFsKwlBODcLus/7JRWDHwlPFexAgWKwS8
         XVkh67ho+uBTIOmC2AZhzIpeeQIz48q9Ua+hmp0wGAmZ20RNIN40DnN7r8FacXkSAZJa
         3Pbijtq0S48eoC6luMd+w94aHn0tr9QsPUOZ6d284nZGopF/j5AFAKVz/+0RVxMgN8+l
         wZyzXmDca68s6RNssqNygsRsl7vXO93lsK/FWGKt4H6LDtzBX1lljvIqiQ/O9NiWfjrh
         XmcukjW7p5bK58zWbFA7qqix5Ho1Ubi9gXwU4aQrJbS1zK/S6gjAb06vloaUo44abF94
         DFrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=nqeiX415RaJMD4cZQx91myCCe8D/6mQpfBY8q4PA4gA=;
        b=yyHb4Qqf3QW7EYEtaiyuE8CLu3NAGM+31ZxDrAhETeJtISqYIDpKDybj9NPe8o0oRE
         y1Hdz5WdsTb7ufuWqM2/KihZTi8cwnIErwueeKGZz3mRk1bmo5+KhKB+FPk0LYOnX5qo
         e8aIXk5UB+XHzjsvGofvWRPJDo5JlTi4KBCH3RglUKhQg8KhrvZnv6zB7XKR0QZrGWVT
         8LuamslWT8XjlVrksAoHFjKICqtHve5Wc8Ro0T/hRe5/AFHQW+rnGALUeE7DFUIyF6z0
         +d5dNM5hcoxDisLXFgDwRJTo7bxADH4MNcavdZ/5KcllKOZLJ5+EB1Pk5jPo8mcsx/q0
         vhzA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=I99dEJgh;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id m93si483405pje.2.2019.06.28.06.53.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 06:53:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5SDrriB109184;
	Fri, 28 Jun 2019 08:53:53 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5SDrrO1006983
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Jun 2019 08:53:53 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 28
 Jun 2019 08:53:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 28 Jun 2019 08:53:53 -0500
Received: from [158.218.117.99] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5SDrqta084811;
	Fri, 28 Jun 2019 08:53:53 -0500
Subject: Errors to compile jailhouse with ARM GCC 8.3-2019.03 toolchain
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <2f1c216b-71a5-5a78-79f5-416b11539d81@ti.com>
 <ace421df-a519-4509-2b97-6713009b85b9@oth-regensburg.de>
 <27491b3c-0b03-0ba4-da94-6a8cadb28006@ti.com>
 <eae01b0c-3e7b-04ac-4ae0-24c407e85bd1@ti.com>
 <8558b60f-cfcd-ddc1-62b6-b3ab9cd762ee@siemens.com>
 <c724fb1e-4c24-8562-cc3b-bd35d45d098e@ti.com>
 <cb3304a1-b322-7f87-a67f-3c6f11fe3d7c@siemens.com>
 <b96fd4e8-686d-2df9-d4f3-32a2bc472630@ti.com>
 <dae8aa98-f7cd-d25f-b8d7-cb0006d08ff0@siemens.com>
 <f2210cae-3d9d-31e3-d587-6502c5863671@ti.com>
 <e46d5280-8add-4900-e084-dbc839fb2b05@ti.com>
 <828e6eff-d11c-7364-797f-623d4d41eb4f@siemens.com>
 <cceb2f75-8899-4544-7e4b-e21c8774ef4d@ti.com>
 <7c482200-ebb3-f373-1186-f36928dea965@siemens.com>
From: "'Vitaly Andrianov' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <aa74bdfd-c7b3-f798-6ac7-6ef836017c46@ti.com>
Date: Fri, 28 Jun 2019 09:50:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <7c482200-ebb3-f373-1186-f36928dea965@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: vitalya@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=I99dEJgh;       spf=pass
 (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=vitalya@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Vitaly Andrianov <vitalya@ti.com>
Reply-To: Vitaly Andrianov <vitalya@ti.com>
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

Jan,
I was able to get almost everything working on AM572 IDK, but had to move to a new compiler:

arm-linux-gnueabihf-gcc (GNU Toolchain for the A-profile Architecture 8.3-2019.03 (arm-rel-8.36)) 8.3.0
Copyright (C) 2018 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Now I'm getting errors:

   CC      /home/<username>/GIT_REPS/jailhouse/hypervisor/arch/arm/../arm-common/setup.o
   CC      /home/<username>/GIT_REPS/jailhouse/hypervisor/arch/arm/../arm-common/smccc.o
/tmp/ccm9f2Kw.s: Assembler messages:
/tmp/ccm9f2Kw.s:52: Error: selected processor does not support `smc #0' in ARM mode
/tmp/ccm9f2Kw.s:82: Error: selected processor does not support `smc #0' in ARM mode
/tmp/ccm9f2Kw.s:109: Error: selected processor does not support `smc #0' in ARM mode
/tmp/ccm9f2Kw.s:140: Error: selected processor does not support `smc #0' in ARM mode
/tmp/ccm9f2Kw.s:170: Error: selected processor does not support `smc #0' in ARM mode
scripts/Makefile.build:303: recipe for target 
'/home/a0794637/GIT_REPS/jailhouse/hypervisor/arch/arm/../arm-common/smccc.o' failed
make[4]: *** [/home/<username>/GIT_REPS/jailhouse/hypervisor/arch/arm/../arm-common/smccc.o] Error 1
scripts/Makefile.build:544: recipe for target 
'/home/<username>/GIT_REPS/jailhouse/hypervisor/arch/arm' failed

I guess the new toolchain requires to pass additional "arch_extension" options to assembler.
If I add asm(".arch_extension sec\n"); before each asm line in the smccc.c that works, but I'm 
getting errors at other places missing "virt" extension.

I don't believe I need to edit each source file, It must be a way to add the required options to 
makefiles.
Do you know how to fix that issue?

Thanks,
-Vitaly

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/aa74bdfd-c7b3-f798-6ac7-6ef836017c46%40ti.com.
For more options, visit https://groups.google.com/d/optout.
