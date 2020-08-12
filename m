Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHHZZ74QKGQEAQG3DPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E28F242B5B
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Aug 2020 16:28:45 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id f7sf971059wrs.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Aug 2020 07:28:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597242525; cv=pass;
        d=google.com; s=arc-20160816;
        b=zSUWW1DA/1VhYRR9zq1Xd469Rg4T7Ug4DZM8kMrEHpto/10RJcwSdoNU8qSse4MtI8
         KwbLHkVzW1SJhpkhuFDv98Zk+kDSt5vxxKAoL1vy5lZwbRnQmA8zvbpl0n8S8TcbjzvV
         8kcIEFyICUuelGdcTIAdU9C94TwgmNE1lLsdW1boU2xasdFccq9kNd4Zlcvk9l2aMhyf
         DLzn8oR7wBH992Bip+xFCJxHF3zP/3OUPNrDDSiBpGtoUSKxBfu4r9Z0zJmG1U4RfTt0
         Zvbw0sbB4eCOdMXA7y8Y/xbDCuh2h1MqlUgQ5wM5XFBcVWEpaR9LZuya1AdOK1MHxRaW
         qx5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=/uP8yt/IsbvQtJnEspN0WyK6tgvafggIbCm8pBxfMzE=;
        b=KQt4nLFm13U/h9qf3DXchhmvqSuL93ACOnEbGWiI1mGE7S3qiWHpI4JBxHEU686gG8
         kPgSwy/XKLVJpYcOkVhSXH+PugHFnCTbWWqlq4GDyShW0VmCfuwN0lQWjIIyiZW48mfm
         8o3aslchZTD02CfWcEzAvKj88ldevxE23xSw+L114ovaUNDK4s8urCxU73+0wbQN4x4Z
         blVhEZUMZjlNzMPWbxMVekGq6ZsvtBLfi2c0nSxy9LVNlofhAjtboHQTKWfhBYsueoQ/
         LD+GuCE6rCpASR1aEaEdL76fBiVixiFl3JSWMDiasAYvBGLdNXtrs0qY7a1IU4clICxu
         uV+A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/uP8yt/IsbvQtJnEspN0WyK6tgvafggIbCm8pBxfMzE=;
        b=Y70HO5UQetrE2eQ+Ig8emJMkiDe12KYDcPjr7bNfzlUfAly0Y92W1THTQsXK77FIyW
         joIYocblKuYurK/rctcWzSV+bkc0TkDlkOZPsZ+v41Yw6clsi/NAqbDjAi8di9fkGf2W
         FxGbwBiFtHwiOZ7McogpOQKf6ETOJsmWLFxHA5Kk72kIq4Hr4lNv5mj1Gj3ir3D656CM
         Wnrgx6why+ybuQYkczCf0sEDapZvHeBAeSirLqJpBqUuOL+XCKG4vgdFNCL6MM3S+5Y8
         CkO4V2Fcrc+yFrm31wJT6qhI+ZeT85PwMh8RApjpe2jkEyKcbjtFzJoMbbwEk/gY0ib+
         amhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/uP8yt/IsbvQtJnEspN0WyK6tgvafggIbCm8pBxfMzE=;
        b=fYlzhUEKNTFsBo6+8OskYm5VRmuz7WQ+NHmy/4eNnECGcIwRW6TRXSAUGVbnKeTK5k
         M2AUuPL36WvdFcGD1MTa93dEs/vTpuXDTgxVoW0DgseAxEIBdesmVg1SzRBT6CVkrvSx
         J6xy5bC6iQ4xHL1NDhACdP1ErfKrjmuXoT3JY5s7OCorbFV5jiFG0xNvpbRfiAhNqge6
         /snZJLEO4pWgyBCnJtOWWOCTFTrRZfdIPe3RJOozH8e2Sq2CCQQMdab0IMIMxkUg/ioA
         vr+KZx8PguvWg3iLyrgd8VbQn15CY8gsCfLxtVpSWKALDr9pB493mgWekFNxm+4/J5vS
         0GNg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531YLZDc4yFHY3EP6Iac57QT2Gylp3j2hFF+6zeYRL+fop1vz1+b
	Y12YWaOiQ56NWRQjlJAzCYw=
X-Google-Smtp-Source: ABdhPJyIpWLFRnk9Qp+Sc0/VW68jW3uz/PtF1ZLMQMIUzNVdj7xZsTSSG0Q7LfdhP3o1C9wu2uzgZg==
X-Received: by 2002:adf:d849:: with SMTP id k9mr36055420wrl.115.1597242525247;
        Wed, 12 Aug 2020 07:28:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2356:: with SMTP id j83ls1098796wmj.1.canary-gmail; Wed,
 12 Aug 2020 07:28:44 -0700 (PDT)
X-Received: by 2002:a1c:41c5:: with SMTP id o188mr4120wma.187.1597242524356;
        Wed, 12 Aug 2020 07:28:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597242524; cv=none;
        d=google.com; s=arc-20160816;
        b=npihb7HDkh/blB2PhXKth6drWGXuP4rUtVNiKnXujNsOe3E/V3X/QfnhTy3oZEic3D
         q/b2xxzM+ulODoMEO/wAAzm6opoQkWz3dyCLJr844rYbMhIJ51rnwTK3jlvGemgXy5nt
         ciwu4a4h8GBqFuYY77+OOxpuz0ntCyEcUXjcWqfODvMHzIYdHBc1uiSPJWSXVOhT/kIO
         xpNd6VIyZStkJ7PZ61PHEEDgc3pE+3Rio4fKx5RvtX9lC0qekGig8KAYRCzmLi7ePt+h
         ry7p9kX24ehLGk/kCjkIOwxd7AQ5qvLm3JQrHUUKZ1h4eOmTSo4fXi2cJQtZDmpS3hCP
         Vybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=ukW1Sn+XeKFvdzwnuH009N/Mzyxhw7UN0n63998FUUQ=;
        b=fxK6euqhkA+ShSPFW/mipuLj7qvzKvl6FduVqR7hDnr6H2UdHWcP29C+rgDMDm1793
         /ECDx3G3V4DvIso6U//WJ9B9Bljkqp8pOhr65oF8e8CqoAWl1tgIS0lB15lfCMaKUb1r
         CvqGCDMqPjYdyNXG1xFYAdAFwlYyH7omzp0XFW5eZBAbOBXcKrpgFgX0xQ/UVfF01/TB
         9XP/JpNgf5wf4bsT23Dep5X4iBB6lqMfT+5CMzS6RHFLZje6GP43Drgzt3nozXSQqMj2
         X8dtT9pw2Uw4SVBwBbIg2w254JC7I+4cJQ0IjFwlcv7EzZoprMDB40L+GcFI9BLo/7xp
         kKsg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id n129si281041wma.2.2020.08.12.07.28.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Aug 2020 07:28:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 07CEShTn032036
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Aug 2020 16:28:43 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07CESh0Q021677;
	Wed, 12 Aug 2020 16:28:43 +0200
Subject: Re: [PATCH V1 4/5] arm: include: protect header file
 hypervisor/arch/arm/include/asm/bitops.h
To: Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <20200811181641.7282-1-alice.guo@nxp.com>
 <20200811181641.7282-4-alice.guo@nxp.com>
 <c7a37ee8-371c-d3e2-90a1-7fda635505de@siemens.com>
 <DB6PR0402MB2760E0441BE26A7031A07FE888420@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b1c22f4e-e712-a1df-7835-ae7c4cea747d@siemens.com>
Date: Wed, 12 Aug 2020 16:28:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760E0441BE26A7031A07FE888420@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 12.08.20 15:32, Peng Fan wrote:
>> Subject: Re: [PATCH V1 4/5] arm: include: protect header file
>> hypervisor/arch/arm/include/asm/bitops.h
>>
>> On 11.08.20 20:16, Alice Guo wrote:
>>> Use "__ARM32_ASM_BITOPS__" to avoid redefine functions declared in
>>> hypervisor/arch/arm/include/asm/bitops.h when building for AArch32.
>>>
>>
>> I do not yet understand the exact need.
> 
> I think we should add some guard to make sure the contents in a header file
> could only be included once. Otherwise it would be easy
> to trigger issues if files was included twice by some nested including.

We do this on a need-to-have basis in Jailhouse. In this case, there is 
clearly no need because of the inclusion policy of this header (only via 
the generic one).

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b1c22f4e-e712-a1df-7835-ae7c4cea747d%40siemens.com.
