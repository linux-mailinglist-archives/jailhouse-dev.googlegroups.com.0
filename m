Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXPPRHUAKGQEE26YHZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6F344239
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 18:20:46 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id v12sf3374533ljv.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 09:20:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560442845; cv=pass;
        d=google.com; s=arc-20160816;
        b=LhNUfVENtllwsDvLJG8lwN4oaqI6tNAm72ry/cSf4FxdyJ0scF15OzvfYvhvKOsE8N
         2F0dlVaS642Hhc0R8P1h9KzRk4OCuLa+ug1d6635NbGJeo7KH7QVgu81Rg8AhS+JekjN
         8vSiPSM15hKSzgpbsZDNOe4PYqcUaVvL5wAsnM1lZW/71YtaAXLvoDZtmYrr02Bt83y9
         acmO9LPNZStWAYkmdrPJLtwj2NXBIEmklWMLltdOkAl3RjeKEPypSVpo9iuA//UFtboz
         DJjzJmkXvzOMErqevaQHEn/ThGRYg8tbV5GIym1d3yNKptL1IN5LOgP/JVKu7IBXwapz
         hX4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=1O9tT6KvQkgbiAvVKcWT26yDlle+rTaxHAQ1YyMwyv4=;
        b=KCuUnmwQNR0X4pLypjjFEnyztN6Zsay/50VrzLT8dAuj7LUveXbvRdVomXkRH7KntW
         FmW4YoeM73f5zEwv5GpuV9LfypKyVmo3X5Q2nrLGF8+ah+GYVjUOS0gFnQv+dRZvVtpe
         O5iZ6cJJDvZSbdilR5U+0SLVbF70aSYPnbzIndxeknb11zC5i7/t6b3I/BgufIYL0amI
         oazc46co8F7v1dAXQnxriT4HLHQhLqLlPEIdOWkUP8v5difzFDhIaIpqa4xE9GcirjLK
         Ix7qekHrkVZjwtmIlsDrI7I9j5lwXAWCt5tDUVLhAZuMvy2kpDPGsm5hsr6qxsikBslp
         gfpg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1O9tT6KvQkgbiAvVKcWT26yDlle+rTaxHAQ1YyMwyv4=;
        b=mQZlUC93i1MNWn7iml2rP1j3RlmE+FWcuaqxQ7iSyut0ILPhXgwP++wAM8jCh0C/Tu
         aMzRcMOL9aHHZysaMzbCxmsut4ZTyiKaBSRo1JTYRTIqlqwp5PDovfc9VSEf5Y/6fJMU
         Lh3Mz2Saw1RtATlrWVC9OFb1+s2wwASRosKG0ciugucEq8zY4hqF79jswCmvnBfISwcI
         cqO7/gq8lcfRUpTBEhrUDomZMCyuGIxoAyvp2Yi04MZtOgOs86bv55tpnktazeZ6Ts5Q
         JwIgAayEwtE+UQ0cBwnPpwjOFdu8aE++RzDWSdnfTDnCjuHvCzMMpX/PoYdndjUfx2qA
         yVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=1O9tT6KvQkgbiAvVKcWT26yDlle+rTaxHAQ1YyMwyv4=;
        b=h3fePSK59tTpqvIuZC5MyyKjPQvTUi+L7ljZ92WJA6oN5+Ta40tTtVU30IFbQGHFyM
         Qee5cC34r8Kcq193XcfxjZLYqy1wjASLF2yQGmfInmP/WqPMW0VycLXeIZkwysIAZbth
         RRbq7SQG+lvU2IyxPvmiEHFNFUTzB2U1Q5YJJysYlw3dN5EOV0eKdwKG+g5+b20SofQb
         waRI0gmOpwSlumksYMv8UzrdmGYr6dD7xkOc4pvH/RozctkDOn4c9ssuKclNKamu8FT8
         sEmGayxL6WhYYwq1b1oK2tdf+0nRI7B3FrQYZxLYxl7ZrBw9hbzCAGvYfpv/LBnLSTWQ
         k54g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVKx3HEz+u9rePh3XxZh4159yry89HDF+2GA6cJZJTOoUpkvyTe
	aoDIYk/kJDB5VzVbIMmlncs=
X-Google-Smtp-Source: APXvYqw2VlJUlHmi2dHpc/JETRBZApwKttc7a1gpVY3oDGjpYD58Bv1r6c1f4r78x+ITxsTLzZbP+A==
X-Received: by 2002:a19:5e4e:: with SMTP id z14mr28340945lfi.11.1560442845682;
        Thu, 13 Jun 2019 09:20:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4142:: with SMTP id c2ls623432lfi.3.gmail; Thu, 13 Jun
 2019 09:20:44 -0700 (PDT)
X-Received: by 2002:a19:7716:: with SMTP id s22mr27927604lfc.64.1560442844691;
        Thu, 13 Jun 2019 09:20:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560442844; cv=none;
        d=google.com; s=arc-20160816;
        b=M5GveyCzhpdW+sqew3WBhaGUGalmuzrvatB0qjdWQz+9ixeLwpUlYEhgAoKZrFLfUe
         U2ql3X8pujwTW/1GeFwNk4xJV81ci6aZ0I6PxiqnVc4GGWJTQOqLGuaE7YdBNCGXOcz/
         WKs8XTzZlTmGuQ4aYgxC4IR46IsEqcut0xHBoqfMzv2HrmuQwpQg24PYUBjA/KBJRqBN
         HL+m7iQmbcc85OazbPVyFWXsBss5i876nh0N4v/CmgnQwN25GRWrGgLdOdUkUmIZhoin
         54byIKpI9L9wRZebImwXPjmqXAxMDQQ/uKxBje0L2hZdJrJuTNAgvFk9h1ylnKXQfZdy
         dGOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=A1I8tuLnUrd9a678UNLUxl3uKru5E8APa6rGAmkJrBU=;
        b=hCMYgrBqAMHVZbTzkTuKbo4lcBHi3EKCv4eElmgcqO8HKiXGvMrbGCZYK0vs4FwfM4
         8O19DxqQy9MP7onTA2pwKL8PWxrgxplQJyeb0sAAZ8/zsyzrvolVLvsK5g8Nm78CTUpj
         2jdS4hHcQiajojogrBYztEzbxXEyCYE0dzT0SUUPia1LRb0k3FwfupmjBZaHBe2XbYtB
         B5HuTESqFwK++oIKMo9VzjnyA7OCJMS7KMc5gQr31PEji1Y0sQntsQwQl1waGQHc5I/w
         P2RViGjet1oDE5tSMOLzkkw7rdfXp50cK9oQD0nayFqwjDphIbUjELb6m4oyh/QsfA1a
         oAvw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id h1si13037ljm.3.2019.06.13.09.20.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 09:20:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x5DGKiMl000968
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Jun 2019 18:20:44 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x5DGKhmt031464;
	Thu, 13 Jun 2019 18:20:43 +0200
Subject: Re: [PATCH 1/5] inmates: lib: Use wider types for time-related
 constants
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20190612130332.6175-1-ralf.ramsauer@oth-regensburg.de>
 <20190612130332.6175-2-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5f477941-2c06-0a37-9397-03aeec6c62b9@siemens.com>
Date: Thu, 13 Jun 2019 18:20:44 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190612130332.6175-2-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 12.06.19 15:03, Ralf Ramsauer wrote:
> Especially when timing is involved, multiplications tend to overflow
> 32 bit. It's better to use 64 bit variables during the calculation. ULL
> for constants ensures the correct width of intermediate results.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   inmates/lib/include/inmate_common.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/inmates/lib/include/inmate_common.h b/inmates/lib/include/inmate_common.h
> index d9f1df5f..c85f1383 100644
> --- a/inmates/lib/include/inmate_common.h
> +++ b/inmates/lib/include/inmate_common.h
> @@ -42,9 +42,9 @@
>   
>   #define NULL			((void *)0)
>   
> -#define NS_PER_USEC		1000UL
> -#define NS_PER_MSEC		1000000UL
> -#define NS_PER_SEC		1000000000UL
> +#define NS_PER_USEC		1000ULL
> +#define NS_PER_MSEC		1000000ULL
> +#define NS_PER_SEC		1000000000ULL
>   
>   #ifndef __ASSEMBLY__
>   typedef s8 __s8;
> 

Did you check if this is side-effect free for ARMv7 inmates?

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5f477941-2c06-0a37-9397-03aeec6c62b9%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
