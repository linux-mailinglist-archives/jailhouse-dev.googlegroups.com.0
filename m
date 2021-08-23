Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNUFR2EQMGQEB6O3LLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 993863F4967
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Aug 2021 13:12:55 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id b1-20020a05651c098100b001c3bda9881bsf1413411ljq.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Aug 2021 04:12:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629717175; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ps1NzQ0qpr+fGFtASoMJESpMci32O43MrFrRLHwcQlU2YhEJvkBZ2Dd1u38OZz/IfR
         k+UT0ISuUAvztpuYWp1hKru4jMjGulH9gFstvilWdbwN2UhzFQShO3gHZxBpzc808aAw
         Xld5BWJhEsFfN8AXHt6Kg/oGIqF4RDhlzowEiDzRLG8rRM/YgzU9dFa/VSMwXXt0ilP6
         ewz8pk3DhVZVThQ22XwQ5fbIryolDr23zllGO1gLJo6Hq87TChXMkSp4VguLTcJb474j
         90Bz/Jb5TcruLYfulQGyLmHa4zDxdKTuy4i+WjDbVmymaDHvbGFlMNIn8PNE5COUFKCp
         LqDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=O19Phwl4aLEjgvEDcSLMnP7nlQnFg7zlRP24TnLoZco=;
        b=K8hB74TWwvu253Kygh+1TV+GPLVQGwmQloyi6xh9vrU9rnfamW5oQYalMeZf5LducR
         JWO2q3EWftlYIFH2eafSVZ2odpLfo29JGyPnbq3hL9XB/kK4yOUbGG2rI1mVFnYiYYph
         Uzwu8zttjDRqk4D9ONtP+1IqEPa94tbpGEObZ2Zp56laNaUzsjNc51tquTalONc4i0Fb
         zr82BrmLgl3EjrVuydnuO7eEx9cD16Gs+3TUjY1/ekoNVs3EHeNuU6KVrVBrZq8Uee/E
         IZCYT65Vz7lkb8hivPpwXQ6DFTEXXyiA1YhlJfXCe6WaQ4eLw76gJ6qDLEjbTl45WpSD
         vCgw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=O19Phwl4aLEjgvEDcSLMnP7nlQnFg7zlRP24TnLoZco=;
        b=gdXij389SgfxwILfVqdHHiI9hR/OSXs47THYgPux6N8RnoDqslEG1wRkxdfkZOe/pP
         ypkgiBjU9jhuSJR01NanGcRMbGzyZDd4iSLrw64VBKA9JXN2oxjI0tPtcX3XnZkFFcQA
         tJijvA5juF7sV5JhQkBzs6cDEIoS4T35Xi/WmO0UeRo6PwqktmGeYEPc1KiK+DbVBE1A
         N5LozghAy1Q8R3u57FfTXgHhpWpDyXA54zMntPP4g5+KMjHMyBE2gXapxwbg2/J9cZGq
         IxJYST4loszthH0BZrWLmD4hXy+9spnms3l0NyE6nFpXVkioaC3NOrghlnYQks4LUYY6
         gzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=O19Phwl4aLEjgvEDcSLMnP7nlQnFg7zlRP24TnLoZco=;
        b=AE4LkAdYtAa2b8KMVCF92R5OQtVDRBOHbnLjXOD+hcgILtP6l977fpKnJCCzkud0hv
         rxeE9tvadX71x2BE0CjiClOYMmgI10S44YSAyDo+A7fslbGnAuimYDj5rUnSlRnyHvAd
         T10LfRw7/QKjAhcJEMr3e0kX5NTkQQ/uSpCWSjjh7bG4jaoAQXPrM3Fgj8qkEnu6fNWF
         mDqx9m/GSDGkHCuIzW0fKZ4wew60NKavfUB3fxPvebOWfCHmNSij4PfETH8L4fVtUvSw
         2McHmP3WTBLpQzLCLcF0wWyFmhBN5Dhd/0LddxWi4utgNs4Yb1ovVb62E4JViHXplqKt
         wM/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530UZODV8B7ff3UyZOeujgGyi7TwIh5ZYhIBD/YkabMhtQjd6QrQ
	Z8vrjvaSbh4RaOyv4bc1e8U=
X-Google-Smtp-Source: ABdhPJw1pAYkee9OKQlzWv6dkt7Xyl+i1dsaCQjQJKEztCTpqhl+jEdMz6rksR4UmKiqRuSSZgnJgA==
X-Received: by 2002:a2e:9804:: with SMTP id a4mr26906104ljj.461.1629717175122;
        Mon, 23 Aug 2021 04:12:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:780f:: with SMTP id t15ls1637500ljc.6.gmail; Mon, 23 Aug
 2021 04:12:53 -0700 (PDT)
X-Received: by 2002:a05:651c:150a:: with SMTP id e10mr27230183ljf.285.1629717173836;
        Mon, 23 Aug 2021 04:12:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629717173; cv=none;
        d=google.com; s=arc-20160816;
        b=AUxFtE9OwbVTnaHC60LJj9vLCrwyyWrC581iDBKypS51a1kebFaVn0Xpr2OzHjeF+z
         4IcG4/87Unas8Ae9qLHvlwB0xTVfjIrbfgh8sFTakEicJr4QxEfryXuSXz9NhKxZAoz1
         JRV3TM2Y4qFDq9i2vrytiej4vbDOX6Gr031adBV9zb1FTKG9ulIPYLoSMAxVbxzmUsnO
         u3Mq78sXlE/zaZBNgJURyEb/I1rmgdEeisY+hPd1nLqtwXN/PAevHH6/WoqXxfs7VOZI
         qQwPKrO4zIrowwtQ5N90WM/TVYG4+t1Zqb7Y0pzkzJezyAmQli0XJ6AL+v9I0ZwEtzTd
         dsTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=5B5z7mWPdJpv0WUXsZsYQq7WZM8KiP61uXWTVp0mhhY=;
        b=yFeA0V6NqQamoOs5L7b7tCFYh5bda3G70OR2dxUJCkfHOXQDsou47J3UQUDDZMZsv6
         23BEtWR+KQ4iICupVUtPsslPmTKzqg1FWs+xRl2/IqDrupfBeEBj/2rAO+WNnLPMeKYi
         T74uk4qvoPZ+8p8ibiKaFhptF8UGjlsLco8IYbZOCsXZp1MCtB1PwUEdVqFcKWKQiIdx
         zLYWBlgSxm6eNkLKlZXIAgI+kQC0XJWqJiEQszp+YfLsBolXKgAqRS3l0MkMbibkdCvo
         fO6jxakXgiIddEumEu+jGwtwu4p568biJfJVI2ksIU6xdXg4YQXt5N2boLRBeJCBYqyT
         nwpA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id h8si698527lfu.0.2021.08.23.04.12.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Aug 2021 04:12:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 17NBCqXr010889
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Aug 2021 13:12:52 +0200
Received: from [167.87.1.146] ([167.87.1.146])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17NBCqn2019076;
	Mon, 23 Aug 2021 13:12:52 +0200
Subject: Re: arm_domain_dcaches_flush() when arch_domain_reset()
To: Dongjiu Geng <gengdongjiu1@gmail.com>, jailhouse-dev@googlegroups.com
References: <CABSBigQ_5F-LfmMxFAtZLpHWfe997LHXUDGfVdhNrzJ3D6c+WQ@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <05fef2bb-c4bc-a81b-c2be-6f0aa7c3c343@siemens.com>
Date: Mon, 23 Aug 2021 13:12:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CABSBigQ_5F-LfmMxFAtZLpHWfe997LHXUDGfVdhNrzJ3D6c+WQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 23.08.21 12:04, Dongjiu Geng wrote:
> Hi,
>      Sorry to disturb you,  I  have a question to consult with you.
> when do domain reset why invalid the domain whole normal memory
> including VM's memory.
>  I think the VM will invalid its cache when booting.
> 

The main reason is to avoid leaking anything from the previous domain.
See
https://github.com/siemens/jailhouse/commit/e27313789869c0f3d93ed4b19424fd859943f94b.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/05fef2bb-c4bc-a81b-c2be-6f0aa7c3c343%40siemens.com.
