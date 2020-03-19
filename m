Return-Path: <jailhouse-dev+bncBDSMF24UTUGRB3OXZ7ZQKGQET2RACCA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x338.google.com (mail-ot1-x338.google.com [IPv6:2607:f8b0:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF1218C2B0
	for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Mar 2020 23:02:23 +0100 (CET)
Received: by mail-ot1-x338.google.com with SMTP id w11sf2618136otq.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Mar 2020 15:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zhEhzpA1sDSWx0T+CHQJbYIi0k8ZEJASWyT7OwEbLhw=;
        b=WpBfBitO/Fbbw5Ss9Aybay8d4Gshcjp0gUZzQtRvqExgz1pcYDHTAxC20t3gO+SYzu
         darEpMBlQsvS2e1KbDavr1uD22wSybDxx9aztHyIIgwQEGhdAdShMz1j5ZvnpDY28Ddd
         OmKzbADLsc0IdiZzoSGuhDRX7xOuDdhgFmlyOr8K+xuZEXiHFibrie+KJyBvefHXSNtO
         b6Dwd0Kzv6TNOAY1nXO3hBACHrr8lQu5GBNozeuK4EbBoSVF1v73RxxNPwUnzg91B2KI
         K6I1/Cnig98OkT2BMmRbBoR4iy+f/CzjD9sa6xUJTftPFjF8783F0V7pONajfcu+Z8t7
         y+8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zhEhzpA1sDSWx0T+CHQJbYIi0k8ZEJASWyT7OwEbLhw=;
        b=nVtD8y5bxbicAk62ouHtWzzeJ5+thHNa2h7pAi8koQ98uQbYGVg0id7A924eNeVgtE
         5VuVHP5sSOlQC9pqEM/uMwaXDd5B7VjZGOzirsGI+Tt2kEYX9FFIRPxxqwXThHpF0/cf
         I3OUkWV9qSXlREUgCC0+YHbsmrdOXeOEyJlGBRnUWROzL4FuoZyhnz+uQriJ0vNV4Mrx
         KGcW60TWGthS9U7rjnlOYvA1h92/Y1T1orU+v1leMVNQWPqtbn5wVS/elb/lWNFkc17g
         l3HCbREJv/uj9ON0bAIyNq2RcITJ97c5t4XTTNeHntg6G9yeYC21qyLV8/cczJd2WDXu
         1A2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=zhEhzpA1sDSWx0T+CHQJbYIi0k8ZEJASWyT7OwEbLhw=;
        b=AQPZPl7pUBbo8+nAa8nwiKR3jelAnDsSsY5AeUxCwaw2N9RubkkbKK0eQYCGkETCub
         9i71ffflQgYXwY2N/5LRtz4u1VRln1wXTKT0ABe4ZdrNzX5SCZ5VVTi1PBo4qnPgHDFz
         +V+xXZsHKmpE0u5mcmQd005s3yzDlQfBImcoPT+mN46knXkFD4uQKhED9ecB5gqFqev8
         EL8ajwJU5hVN8EB2fAg8C4a2Ie2ZIEXK8lczn2+DrhGoOGgO9Ej0ZwlmYSRQgvQYS9FM
         Bk0BhnSflMbuBv0jFc9glGAIaAOkh6G5sawzbUIEcK0Grs431VkSER+fK3uEN0FMVUjz
         oRJA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ1ZnCT72wotLXbm7mFKjDq5RTewYfu9BpurBg4uFcNNLMZxuxuJ
	tK3e9i3c3IK8OdjS3MPM37c=
X-Google-Smtp-Source: ADFU+vvtduVCbhbNWOEOks43U3e9iEQvewh7DGEYFEr/mC8ISnCq9umXxRIUdcHNfzlQ2v7dcvVfzA==
X-Received: by 2002:a05:6808:56:: with SMTP id v22mr3890794oic.116.1584655342103;
        Thu, 19 Mar 2020 15:02:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:49cc:: with SMTP id w195ls1456149oia.10.gmail; Thu, 19
 Mar 2020 15:02:21 -0700 (PDT)
X-Received: by 2002:aca:af12:: with SMTP id y18mr3930135oie.78.1584655341375;
        Thu, 19 Mar 2020 15:02:21 -0700 (PDT)
Date: Thu, 19 Mar 2020 15:02:20 -0700 (PDT)
From: Parth Dode <dodecoder@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0968c391-e1f3-4edd-bd10-9bc8665b11d0@googlegroups.com>
In-Reply-To: <46d73528-b64b-9310-4a94-bab84dc7ace8@siemens.com>
References: <36eac3b7-b6bc-4774-826d-9942dae992d1@googlegroups.com>
 <e680e1f1-e368-5d84-8283-47ef95e3ad80@siemens.com>
 <0a8c17d5-087a-484d-b972-ae286795aafe@googlegroups.com>
 <46d73528-b64b-9310-4a94-bab84dc7ace8@siemens.com>
Subject: Re:
 mc:rpi4-jailhouse-demo:/repo/recipes-core/non-root-initramfs/non-root-initramfs_2019.11.1.bb:do_dpkg_build
 Summary: There was 1 ERROR message shown, returning a non-zero exit code.
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_118_1986720581.1584655340506"
X-Original-Sender: dodecoder@gmail.com
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

------=_Part_118_1986720581.1584655340506
Content-Type: text/plain; charset="UTF-8"

Yes , you're right. Why is it necessary tho to not be root when building it?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0968c391-e1f3-4edd-bd10-9bc8665b11d0%40googlegroups.com.

------=_Part_118_1986720581.1584655340506--
