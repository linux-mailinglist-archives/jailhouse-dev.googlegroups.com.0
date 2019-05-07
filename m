Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTNXY3TAKGQEDATSBSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 343E61660D
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 16:53:02 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id b16sf1144916ljj.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 May 2019 07:53:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557240781; cv=pass;
        d=google.com; s=arc-20160816;
        b=hgudEL+8sorvuhs/gDqxThJHr2PSyetY5FTVdBIUQF6VoC68ot3E4yTy8lDrl2mCDf
         8uNYGMNumlfQHZAQdAmR25ZjV/SPVs7JfTgjaLxHPgDaBYSS09T/ZUoqPFVSI1pYu5E7
         3q/k/fyfsrxhjMKfym8fNqABVowGInTPYi+NsiUyhqJUK8XmVUnOy91XGv/hIvEYSyNB
         IBwfk86XRuTcmmWgWpby/nAfM8TmWrWY12DY5vKvDFKDVfTJwcNpjcFnljjFaw1Dj/nT
         FEGH5lwWO4rA21oaY0qJWr3K81Myl1hCFBHeAE3iqPwmfwhxHslMrbiS66OwtuFjgcuU
         ABQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=OgcP4eJ5NEfVWziMct2WxUlw9cT5Bzj0N5Njoqq+Hmc=;
        b=dhYAohGbAt8woZ8jJBV54Sk9CBjPci98DNGAG6r5z45g5wOrAU+mhw/Un5xH8Qxv/r
         DQ62Ul9XyMCJqBE/OAnoWh3YEN4RhjmjV/Y2+qJkGJYjVgRGFXsMLdWWWvcsOKbOHQNK
         gaFBSTTd/lu15rMb9AJHtlIuFnNr/SpaIdWGSH+tiNrVx00omAMss1w8bOBRv0vBjpS8
         VfPBZ3tu103hghGb++1qEsmmH+jsheh4YvH2DmtlAMCmfZwEctxrYUU2wnMkf3f4pqjz
         a3qSwNcwKIzfV2lT9DD6kVlnv47Ho+UhKoUisWMX0w599J61ZXjPaunv7JTSdWU9XvP0
         MHJg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OgcP4eJ5NEfVWziMct2WxUlw9cT5Bzj0N5Njoqq+Hmc=;
        b=iyPQUwpo/2Ii9fizu4rQ0CXqtDob9aaBmBpYEZ8BaCPWdzGLVM2YKspl3FS24lLpiM
         iYNn4o6GwrKe08Rf13kVHN6tfKMOeqx3kJRsm8k3I/dHBV47qgQI5CuDTYOifGBBvxwv
         bry9QNHUFpn/HpRUs+9ySlE8Q8k5xovSSwOUJlfEaUaAclQdXmQoqXO6Bxa4WJicrtEO
         70ChacIZPZA6frsA5izaAca3+XRepIGKRntO+dPigxXLtYeNEt+G4J0V8xeB6SRDk7Nd
         QDpbAxJb8rAbNSyjbvyhxMXEBarXzJeBLOvRTlemJNZs78vsQGxzXRGiP1FhSU/HS9yL
         E6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=OgcP4eJ5NEfVWziMct2WxUlw9cT5Bzj0N5Njoqq+Hmc=;
        b=StI5tMEMD4RDFRrutaecHVtJTrGKm3NMo0gBBPItS3yiSxgsoa8oh/C5BBvzXMor6E
         1bEbb6CbbVZ6ZO2D/or90mgTE3X3ONhadlN99QLkKXOpeHuFmOtWViTSMvpHj1bKrjkk
         VbE5sYKB3PM2KK6MXnBKfPQYtIgeBI0JiFykzd3mQGXMspk4QSV1bEETUeYFjkj9UdMD
         3hlwt2ontnaVEokOWm7ftmsToi/qh9Eh3kOGfbeT8SutzPy3dA4nDWNars5h4YxzOtQg
         6ma6wqOjNoXu2ok2se+cBi6FF6u5rSJEB4pKQEaXvwHMuDiPh2rW6qiepklLpF3NkLAf
         rqBw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW2hu3ODy0BnJaoFtbStsVb3Ud6lPxQ3JAnGg13SCRS+Zmkc1SW
	qqr2eWr5kJf+F6vsLzvI744=
X-Google-Smtp-Source: APXvYqzYrrbqB8/dIY+9U97WxvRbjs0+qEAl1gM+3ihhJXXkCVzQSaMFimVRe1cWU7qC+sEATQ/XKw==
X-Received: by 2002:a19:ec07:: with SMTP id b7mr11073813lfa.62.1557240781802;
        Tue, 07 May 2019 07:53:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:539a:: with SMTP id g26ls1439042lfh.12.gmail; Tue, 07
 May 2019 07:53:01 -0700 (PDT)
X-Received: by 2002:a19:ec07:: with SMTP id b7mr11073784lfa.62.1557240781147;
        Tue, 07 May 2019 07:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557240781; cv=none;
        d=google.com; s=arc-20160816;
        b=wcZBErYzeKPat9OxElYGiN0E9rktW1WxFlfUFnJvpEeF1oGkgzaGvEb2AMnpcX118f
         PLlT6310+5TaM/+xmyJzyJ0WM0w1Dwo2xex1uV3C21LMpqwTJNMdoyscqKL/W7OXrnD8
         IwCNSK3z3cYvyIZsG6Rj8qaG+B3H3Y9qgxK5pJJbU+MMg9XEvJKFvD23CuzggW8jx9zB
         xD76x93zOGbcFr6G2bAEDgEEakqW3k3CORllYBh9Kzmo6e9AWa/fw1W3b4inA4CJBBWT
         nPGKunZCD2xe0A1Knh4XE/q8kJTnQVjDimg513f3+j8Yw6Tc3XU62qB1LeaQMBI3t1h6
         vD2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Eboh/Du8U6nOoZoFgKqm1Lmrgn7UtzCow3EXDXesMEY=;
        b=SxemehmclVdCMwOTNhtODGpiSW8rJ6qZFssJg48xkacQiiO4/bWDmNvEwfQ35TRpUo
         5I+SD2tyP7VqdOJd1jQkBryS57JAP6qLE/Ym8oVJDgxtwpdYKJvtmfPz3CpMWdWwV1iE
         7Ug8pS8hfx1bYxno0G0CEL3binT9AGqqbTEjaZbaEJxk8kJbdP4OslGkwabV50vafMCV
         o6mKJt4OsYWNoC8KMcZENp3x/YaWP8l1F3CY6++gVZMHzgE9ZYSuEOhtT1KDrXYhIX2P
         Ie2D1onzGCvsjFMDgKO38DWNykKz3AwxF0UusbOEfx6fuBAW0PpU6L9QlWGeMRHh/Zcw
         I3Aw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id w13si503732ljj.2.2019.05.07.07.53.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 07:53:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x47Er0qT026603
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 May 2019 16:53:00 +0200
Received: from [139.25.69.165] ([139.25.69.165])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x47Er08o005272;
	Tue, 7 May 2019 16:53:00 +0200
Subject: Re: [PATCH] Documentation: debug-output: fix typo
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20190507122701.22129-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <84be319a-3049-0a4b-ff21-2eef01bd633e@siemens.com>
Date: Tue, 7 May 2019 16:52:57 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190507122701.22129-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
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

On 07.05.19 14:27, Ralf Ramsauer wrote:
> Shoud obviously be 8250.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   Documentation/debug-output.md | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/debug-output.md b/Documentation/debug-output.md
> index 22eb634f..e3cea6ba 100644
> --- a/Documentation/debug-output.md
> +++ b/Documentation/debug-output.md
> @@ -158,7 +158,7 @@ inmate command line parameters.
>   | con-virtual   | Use secondary virtual console | true / false       | true / false                    |
>   
>   Available debug output drivers (con-type=):
> -x86: none, 8350
> +x86: none, 8250
>   arm: none, 8250, hscif, imx, mvebu, pl011, scifa, xuartps
>   
>   Similar to the hypervisor configuration, a zero value for con-divider will skip
> 

Thanks, applied.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/84be319a-3049-0a4b-ff21-2eef01bd633e%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
