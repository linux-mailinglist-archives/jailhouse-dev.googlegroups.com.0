Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBK6AYH2QKGQECLNAIKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0051C4609
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 May 2020 20:34:20 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id x14sf6271181edv.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 May 2020 11:34:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588617260; cv=pass;
        d=google.com; s=arc-20160816;
        b=HB2Ajhph5YYsTUXOTgJuQAzK9JYbMar7jJ4+fK/bPfPXN6DAM4kGuVjFYX9SSPUh/d
         hV8utnckTiznTT7d+thcZMB/dSI0jdvb8UbdV3yawhTBcKdcMlW7D7sW6fcs5kKqD3Fd
         WKFT6CMKXkGgYPi28SXllxGl5zhGwTyC8JZSPbn2WoLWGHB0sPoG60viI7q5TBoFTgc4
         pro88iUbKncUbdlxHAx9hH3w+cdfYbNY0/h+ML19vhHjZytOWYqFAEEG50qc96kglG6e
         +78l6ihNHEx9GILEELZuB0uXx20zmVjKeV3jHQY1oO5cTC06d1a81Gn8uvKdnX+nlvSy
         QE/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=VvedJZyKnDD8jlSi4JDiPVeIW61HqgIwYvjaTZQaYL4=;
        b=qmuBKtBEY57aayohy0lBtWlhcgsQleiHAhtT2ZYMWIiEzQ3wbgewuhcX6TJRqzeY03
         j8ARxxj95xoVETE7UC8xfST4+ut6j+6MvFt2dN0L8hD5xccIqA32QOKe10IqCp1/8Vt7
         Sw17Lwgb5QVrzsG0Q/gJ3Hg+/XawgYU34GatNqvxg1H91TbB7P0KGlJzzf4dyCfNcWyV
         fkre/Tr9oKf4GENx9Jh7at5rr9b+2xD2pRKVC/wawEdH8LovOWn63M06jR62U+EKQ3AK
         8CLhGNz+UaMzIJIcx+Kez5xQx4TjWl1b0S9mt3TtOBeainPxGUgseC2Lng9vR15i7HVy
         YACg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=VvedJZyKnDD8jlSi4JDiPVeIW61HqgIwYvjaTZQaYL4=;
        b=o7ShMBUT2Z718FZD7hs+vQEzLNIvLr/uXR8WpEG16l3agSoa2a0w9WhZfQrdK+OTES
         2wyGByomQmxASBaaQLaGHlSVGibqcayUIGAyBVtMXkiYimP5fO7qNKSeWj46RrKxsQ2G
         3RMkUy81WZymWoV8MIcfCyTmWOXZMXtWqjaVnA2rT5XXVung0CoaXVmVW//afIjHr6/8
         PzsI3R6Tmw00KYuEl5az7Skhl0q+Lk0C9by6x+hDZ1UPJ6C6g0kOH47azf0cZEa9oL4X
         Hg0js0J/Fc+M5U2mGIe0qFwTi7OMhWc5POit5vb3/Val+dXc6BRpatzl1yqqJ/S1+z9k
         faOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=VvedJZyKnDD8jlSi4JDiPVeIW61HqgIwYvjaTZQaYL4=;
        b=KD8ULszVJxOJN4zrVivaNDlMUdzZweb07xTVDViaPvE3oC3kzug+ZQ/ZPdn1RQtVt4
         dOB/ml1VwZxO/wlEpi9kcYF1662j4B537vSDjGHYQ5W17fW6FokE9IoSb0iIz8PFKwyk
         TDJJ/Nci6q5Jsq55smIPBRyXxf+kACe+IdH8dxpMp3/PYU/+ikYLjsXurgAfSo7saySk
         jkPPo83C7yB9PUaHIh6r3qJH2XjmUCxObRq9hsYuRAnRXpYHELShoSNtXZHK368cGtZ5
         vNydPj2UFkCPPIlJEQSbAyehkspApD9xTrcC6BuWG92vI4vCt4LVE76Xj3PqTOgKZInO
         SnVg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuZY04DRUpWeP6bnFOXmQvcC9vhg2YfR2wopcDBVa94QWLC6H3uc
	kd/NTbUQ6wFCtNebSLgoE2I=
X-Google-Smtp-Source: APiQypJ/wHvtdCPoHX8fD+4V5/g/eUW4D9lsVvlxGuaxBGrEYrW6PSoa2FbU1fsJz8HTA1tuVCeFFg==
X-Received: by 2002:a17:906:37d0:: with SMTP id o16mr15352928ejc.368.1588617260275;
        Mon, 04 May 2020 11:34:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:ee14:: with SMTP id g20ls6114724eds.10.gmail; Mon, 04
 May 2020 11:34:19 -0700 (PDT)
X-Received: by 2002:aa7:d542:: with SMTP id u2mr16318643edr.234.1588617259429;
        Mon, 04 May 2020 11:34:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588617259; cv=none;
        d=google.com; s=arc-20160816;
        b=QJYJHt2h4u28yDw/iR3R+6k2Xf2Y3QCZqo2qF4RadOltWaGDqnsFr7w0aiBSrG2JmP
         IjtcaM+x1xNEQrKPhsxUjJzNjS3B3raNdIBu5xRzanuLAtiHZesvzbdQ3kFn8YAdjLFc
         EMkGpW0v3dJcOdeuoG5aUD5PVmd6tP6UcPoTNw5QkbrN9gb8R9eTy4U6ThzfQfnHv6hY
         5l5fgF3tEqrJIHvXNqu1HJOOMe6XjsyA6Jf7kl0rm+ugKJA7IzcgYxLqTGh4CcoBuUS+
         XvAuCoxeqeqgpi8zkYfBhay4IZf0cW4IvtlDGYbkvZvip5qkVvtlJKNRLHkoLQi3o621
         D/7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=IZi38jWHuF34dsRz5CttTva9LCszXYad2ZjMlAH2vug=;
        b=kfzvFEe72boCHCdpOrpjlzECBwn/a+k1VaPW95lbOm+IXbQaPLhYW8KfjGjLB3yoRG
         Q95jwhdMBueDZB+JyGdiSyv0BVxFkdGeBCqK8tG1W4IYOcBfzmV9bDVar6OBxrh8FByj
         i/thsjotY3Jj0VDaORH0cRaINSesJikwjj5BzpfCQ5qvg9bS5929SAdeySXAgKXwrS5z
         EyxeMdRLP4uf2F6eHvU6mkGjezmsp+aQGOf3NMyQ1trUrpwCQApX5aGbYcbqwh6ckw80
         xfWpIblTyX7rJqgjfsHTxA+LJph9PFN6j12TlCWxANGROdPoE5dbShB7t7yu6MucLXnc
         dcgg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id r26si589671edb.5.2020.05.04.11.34.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 May 2020 11:34:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 044IYHfk023002
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 May 2020 20:34:17 +0200
Received: from [167.87.53.26] ([167.87.53.26])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 044IYGEJ018513;
	Mon, 4 May 2020 20:34:17 +0200
Subject: Re: [PATCH v2 5/9] hypervisor: introduce color_root_cell_management
To: Marco Solieri <ms@xt3.it>, jailhouse-dev@googlegroups.com
Cc: Luca Miccio <lucmiccio@gmail.com>
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it> <20200421100351.292395-6-ms@xt3.it>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b032e557-c190-3ef1-6ff6-3c93b2c97c6e@siemens.com>
Date: Mon, 4 May 2020 20:34:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421100351.292395-6-ms@xt3.it>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 21.04.20 12:03, 'Marco Solieri' via Jailhouse wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> The usual life cycle of an inmate is divided in 4 phases: creation,
> loading, starting and destruction. The most crucial phase for coloring
> is the loading one because Jailhouse relies on Linux and its driver
> module for loading binaries. In order to avoid exposing the coloring
> logic outside the hypervisor, use a separate memory for loading binaries
> to colored regions.
> During creation and destruction phases there is no functional change:
> the memory is mapped and unmapped using coloring functions as they
> should since we are handling colored regions.
> During loading phase a special colored mapping is created. The latter
> has the same physical start and coloring logic as the cell's memory but
> virtually starts at col_load_address.
> This will expose a virtually contiguous memory region that will be used
> by the driver to load binaries. During starting phase this special
> memory is destroyed.
> 
> Add the missing CELL_CREATE state and introduce a management function
> that handles the colored scenario for all the above phases.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <ms@xt3.it>
> ---
>   hypervisor/control.c | 128 ++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 119 insertions(+), 9 deletions(-)

Well, I already state my aversion, specifically due to these stats. ;)

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b032e557-c190-3ef1-6ff6-3c93b2c97c6e%40siemens.com.
