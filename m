Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZM2RGDAMGQETXTTNOA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3c.google.com (mail-yb1-xb3c.google.com [IPv6:2607:f8b0:4864:20::b3c])
	by mail.lfdr.de (Postfix) with ESMTPS id E545C3A3231
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 19:35:34 +0200 (CEST)
Received: by mail-yb1-xb3c.google.com with SMTP id m194-20020a2526cb0000b02905375d41acd7sf350185ybm.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 10:35:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623346534; cv=pass;
        d=google.com; s=arc-20160816;
        b=kaJkvEcqFr8Htm7IVHiLwkUbWcx+UwXaoeI5KFVVTFAk4CU5Qh9gRWL4LYAMn/DDud
         YmQeB/QtjLdd58AqFTy32dRlbV0WE6sFheV4B49Bfni3rhhZO1sHNsbXNfz4n3X/rYWo
         jGiIWIh8DZhWWd3+04LAjB09VLWQgbd8bHL1EM0vOzwxEmoDnu7fptzTHqSoYjNImbRc
         JE5D3jrVmhSUT7W6VmpqbwbplHIyi+YoRz+nXjctETaTu2cRFgQMCNjgy2UijT3pv1Dw
         pZ5rAqi5EUWJXb3SO9keP/f6RuMgncunyH6wfYzN53eMBYBSZHnqGuMpV9r4mzuthg6O
         0Mag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=R7MuzqLUMRG5+g8zCM6UYvJiIU8zgMXmfv9nUs7yPRY=;
        b=JfMQES6o1VKSX8t0ABwbye2JTRK/+EI9h1Tdx2ag8RUWPA/TCbZR+8aBkEV0nurnEm
         GAJ7+O/VHTZRb4bliC60QlMmuvef8v78JW1gmZZ+ozZ+V7kuEQBNzcOytVpcWf3yRzWR
         gWCOp2iBjegGmAbXaZ0LuNn2Glo+kVXT8aEkEYrZfiP4tFVfwnpgVimWi2tGaQVg7ZhN
         NtNsQKr4OFkLuHNEsbeSgEOU3zLejJtkdTsWS64SzYU6cAgmtTa/dJUKuZpsbAgMvzLk
         dGezWDgezctthBMaEHtKUFzLg00PDeJov2Lfh3srZAPe+QZuXN0w+NmBVdW5ONIez3OB
         BT1Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=R7MuzqLUMRG5+g8zCM6UYvJiIU8zgMXmfv9nUs7yPRY=;
        b=RPsBCgos8ANYWaUohvdIhhufRQxPQE3h2FsaDCr9OLma/uK0Bf34Ss0uXA7vC04HJF
         l3NnGqJ9qOpGn995TT3rIA6zUqWrHs05jFrakMdpoGZl9qeBeu593AhC/qpS4B3gcjg0
         rKHlPqcYmP2dFDThG8OLULyNHfQd3mH1dEXIOlO/0tAQn+dhR526RaziXPzAYQXGJ5Od
         ktkKLlA5BFq077PrZNepbTpeLOV6v5x27DPGFK4/avzXNQIccY0+XW8NF9ePUwtlT1kX
         5L+McdmE8zUCTEJp+E2Y7LwB4q9Rc/AmS2E6MWnHn5Hykto0urUetJlHpN8poZePXsqR
         cQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=R7MuzqLUMRG5+g8zCM6UYvJiIU8zgMXmfv9nUs7yPRY=;
        b=ttxGnZGECEp0oDR7ngLGJwvjA8oz0o2HYMnXEFFP5pntZRHHuuy9vUDEEfooncZZv1
         wBdL+Vp1jDJIXaFuBDW2apyyI2W7y4uXnjuJu1R4WKqOtkIutZDXLiVa6G+lvXR8ukTF
         ORRScEOhhNNbb8PluHiwa6TCOMVYVjbMK6gEbPimrKDtQt8cFGAy1BHjEu3PnrnwVDML
         VbtR9VialoUAJoFOUP50NX7JPBqO3TSbH+LT+tA672faIB3N8MaLNtFVZcJqq4haFFrt
         HA3mu0X18JQVlMa4ob0Ih0Woe9LaS260uItdxIdSQqn/J8G35XHo0DaZblDs1YS4txWV
         mX5A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5300werxxMFkky/Q6AnBP+TuKGxOcOj8xuUdd47PrSJdfXZ/irEo
	iURNguh9Q0xcq4B8wTojbB0=
X-Google-Smtp-Source: ABdhPJwg9vR0nl1f9PZMMjxSTt1mj1tbXQ+ryLCv64QWUt2EgmzNAlHCrl4dP4BqKXzbWsEQL8kKFg==
X-Received: by 2002:a25:5015:: with SMTP id e21mr9119234ybb.166.1623346533442;
        Thu, 10 Jun 2021 10:35:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d257:: with SMTP id j84ls4187713ybg.5.gmail; Thu, 10 Jun
 2021 10:35:32 -0700 (PDT)
X-Received: by 2002:a25:a0c1:: with SMTP id i1mr9614074ybm.409.1623346532862;
        Thu, 10 Jun 2021 10:35:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623346532; cv=none;
        d=google.com; s=arc-20160816;
        b=rOgPRvXf6wy9gCjjrSmVeP0Ki081Yi0ggk+IwOZ7WY2S3+IH1Kno1WZMCdQVqEdpx0
         4ZIrfgUCBdeKCs9l7URdRCIFdRjAkR8sM4u+SKujhqhVsPtt7kmpGjT97BmRAzIsny+9
         JFyJURRSivYTDwdDH+JELyy8H5mzbP+0PD8jCv/15tzLdAJAvofYoz7zFbGjcv5u6skZ
         PD8Qyhc8oijbUwNVH9wP/2+ckig5j3aIhN7ZpL/T/dgHY/chXLAAGTfbk+AYlWJ5m8l8
         xS8zCwXeI8C0TdwE9T39bddE346L4nkQjlLvTTGwZyHdBY+WoAkQiRJKkNRrVWaArQ3O
         qlVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=PgdJIEN1ePz6BVDIHae53pPYdX34KmbVKvW3kxkUaPw=;
        b=PZF/rjyhyugb/x2OEBRr/dp05KtwQNeCE0tc/JLWmiWT3qk5ZQo2Z9YKJXQ2cdhoU6
         36cvxnYcgFhGezDI8GmnfnMu8KTUIwHJ7HoS7nEk/MYBHce6pPkdYvJJv7S0j0Bqj3PL
         Trnohp+/VGfREaKxkKGcgyPaAr1FGmnUiufx5Fr3/f+pJ4361f5W8sEVcJuVnBxcITgI
         Qp3S2Du3cm+nJsXGPzJOBr3KF376u3O+tvkYzDawlwlkasUQVPR3whz2ffW6Ajqtpv9h
         3XQ9Yq4vb9j3yI+FI7WIxUd7mwppplWt/7yxvEHWCTNn3K7B753cl0bo8ub4AqVIvfCT
         u4jA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id x9si505864ybn.0.2021.06.10.10.35.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Jun 2021 10:35:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 15AHZUsC030817
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Jun 2021 19:35:31 +0200
Received: from [167.87.0.117] ([167.87.0.117])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 15AHZUWl030291;
	Thu, 10 Jun 2021 19:35:30 +0200
Subject: Re: [PATCH V2 1/1] inmates/lib: Set cell-state to shutdown in stop()
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <AS8PR02MB66634B43A4070BFE4AEEB902B6359@AS8PR02MB6663.eurprd02.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <335fc8fb-9e9e-eae0-a8ea-81976241468a@siemens.com>
Date: Thu, 10 Jun 2021 19:35:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <AS8PR02MB66634B43A4070BFE4AEEB902B6359@AS8PR02MB6663.eurprd02.prod.outlook.com>
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

On 10.06.21 18:43, Bram Hooimeijer wrote:
> From c310558edba8441fcb017592d55cb0a09f7f196a Mon Sep 17 00:00:00 2001
> From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
> Date: Thu, 10 Jun 2021 17:27:57 +0200
> Subject: [PATCH V2 1/1] inmates/lib: Set cell-state to shutdown in stop()
> 
> Ensures that calls to stop(), defined in the inmate library, set the
> cell-state to shutdown.
> 
> This prevents the cell to be locked but unable to respond due to being
> stuck in the halt() loop. It also ensures that a return to inmate_main()
> shuts down the cell.
> 
> Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
> ---
>  inmates/lib/include/inmate_common.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/inmates/lib/include/inmate_common.h b/inmates/lib/include/inmate_common.h
> index 1c20a0af..56cef77d 100644
> --- a/inmates/lib/include/inmate_common.h
> +++ b/inmates/lib/include/inmate_common.h
> @@ -93,6 +93,7 @@ typedef enum { true = 1, false = 0 } bool;
>  static inline void __attribute__((noreturn)) stop(void)
>  {
>  	disable_irqs();
> +	comm_region->cell_state = JAILHOUSE_CELL_SHUT_DOWN;
>  	halt();
>  }
>  
> 

Unfortunately, this overwrite the CELL_FAILED set in x86's
exception_handler(), e.g.

Which call paths were you addressing? Either move into the paths that
miss to set the state or add a test for CELL_RUNNING/_LOCKED before
setting to SHUT_DOWN here.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/335fc8fb-9e9e-eae0-a8ea-81976241468a%40siemens.com.
