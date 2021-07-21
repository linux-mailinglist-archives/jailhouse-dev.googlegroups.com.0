Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBDXO4CDQMGQEDDG7CLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCCF3D11C9
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Jul 2021 17:02:39 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id t8-20020a05600001c8b029013e2027cf9asf1117691wrx.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Jul 2021 08:02:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1626879759; cv=pass;
        d=google.com; s=arc-20160816;
        b=pvV74mMaS+WtCazWHqWYirS1p9EKXj46plk9NeqLm3QSmvpdP4qn7v2Hb58ObQNuXH
         tCO36JbDqsdaLkQgDMfDPu6USOC/+hNKiry1pV0XkrOGM9rmbYZwJj6RpTX/JOSwSl6h
         L1ye9JyEaBwe4fC6NpzJ+fVpxLiDVgtb15swIUZVu1+ynn/jEgJyEO2Rd8LxMCIfPoX7
         fMTPTqn+75q2RUAV3f3WAuyipcm1F43bHABdlcdgbd/Sk5YYCi5sZ/Ads5peUJvEbUMK
         ofBukvNQMG3GlMxnsTeqTjQqJnrFNPrzWxGti/wqVjP9ENeKqfZtq4xt8plUVTgJ4T+7
         aH8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=V7s71o7vdPATTnLvTfqfmdwWd+1/n+ZQbzZBJZxeT6Y=;
        b=GxtdnmSxymucdNEVPYFBM4qcQOyBLTSaw1WuAzjSGqM6gwzjFCnJ/LPfrhLV1q6P2l
         utOdttUuuMRD8OBGqAQJy2V+m9eSxvcPRFHQcEf5oZRQb1kTWB5HWvS8Dzd3j1QEIFN8
         TbsydGYuYcieQzpN+EUo7fYhTp/xerAIR4VkTzRPMBV6TxdrKMtIgYZBPkjZzlAEw2IK
         vkOUaT8Dgousn2yihlD6Gr7WI6dgYI5jAVYvB7aKo4maazsVoSwNszS+n+wygHP5SXVJ
         /u0bz7nAfQ5Fo8XttLcJaV2tHvwsR8HI/VUU+Z/6URIYhbrK52FJZkjYQZhWNgFTGhq6
         /zLQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=V7s71o7vdPATTnLvTfqfmdwWd+1/n+ZQbzZBJZxeT6Y=;
        b=pwCs4SZk1MZy6WlD9U4S5u6yUDYCfi7PCmj0zX+W+rch95n9N7Zf5eA03AlxdP11Kh
         qEACjxNO9YH5UmbTO9Yl86pVmsU/RbBb7TNYbyjd39BnzSnZm6J9qFN55V8V9vIJtt4p
         qSQer8VMQFmf2+JqG3Crn4U+2HkXyJXaLRP3RZ2epEUEqz7GyzQ+HjK9VzcZMS1J9yON
         ZVUM+mktB18QTZYOtEe8yVSZ3TiXAByz0FEkZValhoKaUqCYnPW/Nl0A8i8cv9tG5dmP
         Y7paYiLm0h6Vq7qcba440+AhedI9PZGqkY2PWfWcXFWgTw7GOGA7LwwCSnXZuK7NVBVN
         jC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=V7s71o7vdPATTnLvTfqfmdwWd+1/n+ZQbzZBJZxeT6Y=;
        b=RGAt3pRWbKNBIl4NLb7XWIcm3O8Jk7sDV6Cckcp5mNvmVAE7wrSOoDTKlCNocpkwWY
         e/ZseI9cmSqbRU6nxUQ15uHJaEAZ8VkFFeE8XK/PXWYl8wzWnvp2d1Fd95zTTpTmDD4N
         pkwWpT2C9sQqh9WC3BHSfREqrt7CFVbuymoX2eZIJlyre3zpgX5asMh6q4S07bd9lVpO
         0imPo5DSmDd/54suWIl0HuwXPe92tplg1OwgPvw9BekJPW+t51flyniXphc848eoits6
         XMJvRX6sG+2i3xWtYWcmPVSQMTXRwFOsaidnKAwKkjq7BzXJJlDDqgGHBdEL1p9WvnLA
         0n2A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532/Wif7Gu6EVSrg1nbEVICaZGP1MFU9o0DM7kcfEDSnwHzMEIwQ
	tCMS77si7IZBYspGA7T657c=
X-Google-Smtp-Source: ABdhPJxSnHs2vF99iozF/vIMEml1TDMUPXkyu+F9cVKQqm9KnmKlwHcB4pLZU2iP3v6rSDciQ1R1VQ==
X-Received: by 2002:a1c:f414:: with SMTP id z20mr4659971wma.94.1626879759158;
        Wed, 21 Jul 2021 08:02:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:198b:: with SMTP id t11ls1199904wmq.2.gmail; Wed,
 21 Jul 2021 08:02:37 -0700 (PDT)
X-Received: by 2002:a05:600c:3595:: with SMTP id p21mr30610622wmq.105.1626879757205;
        Wed, 21 Jul 2021 08:02:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626879757; cv=none;
        d=google.com; s=arc-20160816;
        b=w1mvPwfthvD17D3elLhKlf1/LUnmuBZzXUYpiGMuHL5241IHQr9asl3gEdojC16S0m
         KQF04UX9LQyFhsKJjZb/nrbAEuXDO4uk8IOgNQw0n8jHjAmNq14cq5GKbsXtwqzto+Cn
         QhQngh90t69EwG1HNI7Nl7VyoBVsEGvPIYa39LahRzKCWW9m7clPFFFTKvXOzQUQ8xLz
         KjPlGtYFGhsIXE7DzaFl+N2x19TZm5eYHgk7JxDbsfWiU0+THYDraDmk9mSjY88velkC
         Xly6wd5Od++N7/8M+59JyP/kIfnnagWRNzLmqTXh7OofpQEUExnk2loLh5bc2iOFmDa4
         bcrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=PB0jYaJvh7CJVYOWqO7ZLu9+Bl9l99HP4kIfZe71S2k=;
        b=iPsAYZ6DNR3wllncKSx0bb++0h4XppNE2YyncHsrOhuyfHxFRnI7EGtIxSjqtrUkui
         O+vorr4PWb3GaD48sgjVF5y+btF6Ijev+zVEzCOu5NnXDwSmSSFSORuqipdUAH/nHMnw
         MI1YSfER+suYa3YJuiqppJ95V7EfyT2mHihevxxS6Wg5mZkZOBF/ED7c0mExxCS4j//H
         7JsjwXbvj9xrlc39H/1auPqsHsBKGB5cJPnjENYB2PgJ4ZySiLs9tqCXv9pN/5phmVxs
         LYEEZ7hRx9LOThaLucO1D8DY8Yx6oAq48ZYeXsYBRE+dnLg3dxfTQe2BkWBHMZX/7P4D
         aekQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id k14si931181wrx.1.2021.07.21.08.02.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Jul 2021 08:02:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 16LF2auJ012021
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Jul 2021 17:02:36 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 16LF2aeN020231;
	Wed, 21 Jul 2021 17:02:36 +0200
Subject: Re: [PATCH v4 0/4] Support building and running on Debian 11
To: Florian Bezdeka <florian.bezdeka@siemens.com>,
        jailhouse-dev@googlegroups.com
References: <20210622090502.231179-1-florian.bezdeka@siemens.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <045c5b59-11fc-019b-4bdd-2cb79ee5de19@siemens.com>
Date: Wed, 21 Jul 2021 17:02:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622090502.231179-1-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
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

On 22.06.21 11:04, Florian Bezdeka wrote:
> Hi!
> 
> This are the necessary changes for building and running Jailhouse on a
> Debian 11 system. As Debian 11 will no longer support Python 2, most of
> the changes are related to the Python2 -> Python3 migration.
> 
> Testing was done on x86 only so far.
> 
> Best regards,
> Florian
> 
> Changes in v4:
>   - patch 3: Take care of python2 specifics in sysfs_parser.py
> 
> Changes in v3:
>  - patch 3: Fix typo in commit msg
>  - patch 3: Retest, correct ExtendedEnum(metaclass=...)
> 
> Changes in v2:
>  - Address review comments from Jan and Ralf
>    - Cleanup ExtendedEnum
>    - Remove "from __future__ import print_function"
>    - Migrate shebang of scripts/arm64-parsedump.py to python3 as well
>    - Update CONTRIBUTING.md to mention python3 only
> 
> Florian Bezdeka (4):
>   Makefile: Update build dependency from python to python3
>   tools: Update shebang from python to python3
>   tools/scripts: Remove python2 specific code
>   doc: Migrate docs from python 2 to python 3
> 
>  CONTRIBUTING.md                               |  2 +-
>  Documentation/setup-on-banana-pi-arm-board.md |  2 +-
>  pyjailhouse/config_parser.py                  |  1 -
>  pyjailhouse/extendedenum.py                   | 15 +--------------
>  pyjailhouse/sysfs_parser.py                   |  7 ++-----
>  scripts/arm64-parsedump.py                    |  3 +--
>  scripts/include.mk                            |  4 ++--
>  tools/Makefile                                |  2 +-
>  tools/jailhouse-cell-linux                    |  3 +--
>  tools/jailhouse-cell-stats                    |  3 +--
>  tools/jailhouse-config-check                  |  3 +--
>  tools/jailhouse-config-create                 |  3 +--
>  tools/jailhouse-hardware-check                |  7 +------
>  13 files changed, 14 insertions(+), 41 deletions(-)
> 

Thanks, applied to next - finally (sorry).

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/045c5b59-11fc-019b-4bdd-2cb79ee5de19%40siemens.com.
