Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4XEQD4QKGQEIKCF3LQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF81230C28
	for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 16:13:06 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id h13sf37488wmb.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 07:13:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595945586; cv=pass;
        d=google.com; s=arc-20160816;
        b=W31eoqnoVQl/lOXmDsGJGHWVWj7pTEHiblX+ZlRTBWN0bqgZHRb2VpxrIsC+uJDOpM
         7rcrctt/bKZZWOuTO3qvIkImN9TeQ6c8EzLWKxq068at4Q33CQYAuWg7CXGYmBjggtc7
         l6FfwK2LL+wWetfJ/hndrKu9NbNyQYNa+EhcUTReZJjTxL/wwMOrXqjDK4oDgBWG8VyC
         RlCLc7Jjc3Rsl2zCo1MvYTQjhCbhZZyx47S0lrBOR953Lo+JbOH92AJX8cGNCRgP0hKS
         /DZAlwBYMg0WX/CcJW6o3ASmAf6mR9l0JOv9jZND9Z+rUvF76zHeNIYIBo6HxCLyUoAy
         kfIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=vzciW7OPZvtuf6HEsI+0i1TCaW6+f3o3QFwGm+fAi/o=;
        b=nyOf9+JTK7h1aD7IgK3PvloFxMjEo4OEoqdpcBYcFmZvXG693lBl0kZGfrHQ5lUmZe
         tCgY7Er9D8JH+UaFYf0GR6RHrfMOADd5XXVlroiB0an88I96HJS9XVrWtkD8HZ5gFw5M
         5nIE6C3DgGNXkVAujUe5tBcW21gdn7Bhy8jHQPYOzBJWVT2qiNzjp7KmYTwp9/4xRviB
         x3vVzp26/hIpil003QRAwFF0af9i/acuUmt6b6yWYh4Gk+3W/WT3OivHB65qArFX5DfB
         Rn6d8Vp/zTJ0akbc227XvhPdWUEg+Lishv+MENCGUhCpIbljc6OrfFfT2YXdLX26CEx/
         OCxw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vzciW7OPZvtuf6HEsI+0i1TCaW6+f3o3QFwGm+fAi/o=;
        b=gI8QzBHrY+Vi8EBFxSt5u00WGJVYp+MTHyosJHgHqlme5fOJJnOTx7UiByGTSBO62/
         OWss82gq3ZRKn8fL1tCAFPBsfSqdo4s7xFHIZtoxTaj8eAT9CTdP89vQodaEnjLXXF13
         PCnHnOv/exuaIc0d+Qvjrb158xMnUqbT2INaQLahO/xja0t3LU78S5x/XUFDPbvZe0PW
         s9Mj6bIZ9XYne+bSUsidPDrt1BulTlwbQ+2HYhEL1/tC3XpFC7Vvp+CXo8NVD27BojqE
         7/Q6NvcxnKKUYrrSTq2+I99FxhBzEArY9MjJrZ4z9Br2T0kLS4P6nWK0EE5K0QGed8/+
         SXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=vzciW7OPZvtuf6HEsI+0i1TCaW6+f3o3QFwGm+fAi/o=;
        b=tF2In3o5zP3YeSihKx2BYyX1YNOVAByEMiLhjIEFYDTNOKVj2LC7mA+SOxw7Zk5uFJ
         eWfFEJLlIIF8N30UxdeG3NrtC2olARXLnvlZC/eIPrdjkxV29dg6578hLaOMeSNXCXH4
         lMvLEu1vnXeF5JKv5rlb+fi9lBxn3qMFN86kN74NoskFBATx+ws5dzSFpG9fIZrR9dzV
         S5BEa3sdt0MXd9DlmxuzNvFS2FkeZDujkAeRB7is0DzyR7xreMiambOIF23D3+k3RZp5
         I3CD1k2EDHXMkyIIma3HAsCzB81FKsXxj36Sfg01IHL6NsevRZRbnSvtq3GMJmT/lrUF
         BQyQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531yPUdux1v2paSbXkr8YE2QC4ClKZ5fiJ9YjcQQ/TwwkdBvcw8r
	Mt6qPKArwf1iIVZ7abolpPU=
X-Google-Smtp-Source: ABdhPJzy4K/B9098Q6Arw1fAohBEMYfPK/VithAbCKv9HBWAmbLqVA6smPC7ovcIT9/mto3ISLR9jA==
X-Received: by 2002:adf:c108:: with SMTP id r8mr26021175wre.41.1595945586210;
        Tue, 28 Jul 2020 07:13:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:81f4:: with SMTP id 107ls12549102wra.2.gmail; Tue, 28
 Jul 2020 07:13:05 -0700 (PDT)
X-Received: by 2002:adf:edc3:: with SMTP id v3mr25152602wro.193.1595945585509;
        Tue, 28 Jul 2020 07:13:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595945585; cv=none;
        d=google.com; s=arc-20160816;
        b=YAls2C+4Z7wKdRnZdOp8A20bAkQ7tlePUTeg2xdOKcBKl8HGfVk3dRtEsB3opwznlf
         akeBZxHwk8uSz2a2YW6A/Y7w4XFCV233ud7Y0+VFp+NflPpiuF5aMqSb43syr/8z4QRm
         91de9YWV6Lph6lOPsLxpjNK7dEQx1sQmJsut+Gt8dHSEhg/LUdRC4izGjcsJdWfZpujR
         TMNaZF8HxaE5MXArKTlLilqw3g2/hvzFH/zJ6qL2TfcA6UNpd5diwA1bClcAJlP0fWKv
         n90jbnxqVkv9+rxKc5ov4rxtVUiyGvt8JbDdRmudgC8WvuWVwIuIKcDLNch5uXmbjLE5
         xbXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=YRpkCkdRr1Xeq+y/A6In4esOq83fPkKSMD98BLTpj9M=;
        b=F3eccIgNO79h8DBjTHd7OKh+nAenTrqDUdOYvk4prQL7KgScw/Rs9yyiwxgrm5MS6i
         9FyTBndmPdyRrjZh+Q3czKB9Yl52WQuCN6N58hyPuQwfuZFanuvy4m77IQV2zwFqH5JE
         T8Z2tXFROR+KY1Nc1dOh56ZOhGw0QwmBOUf/MjMzshW5fnX5Sqg3+q6xHNaH1TO70tNU
         t6nz6/fTmeXscteKPVJeRS0sEf83aEXE99M9Rs7Wmc6vFjqPB/rczMn6fm7owpMgwvO+
         7Z8Wj0u12T+CFDxjKo4up+NFoy3ujEPPNt7+sBJTCmOFxhR5UqEt0LSm0wIqX+cOOHoM
         Y6nw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id i11si367063wra.3.2020.07.28.07.13.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 07:13:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 06SED41H000600
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jul 2020 16:13:04 +0200
Received: from [167.87.93.82] ([167.87.93.82])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06SED34m021646;
	Tue, 28 Jul 2020 16:13:04 +0200
Subject: Re: Jailhouse + Intel NUC & serial port
To: mail.to.rui@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <150f6988-6b93-487a-80cf-0050dbe46381o@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e4c67610-0592-b5d7-f727-2ec01bf47970@siemens.com>
Date: Tue, 28 Jul 2020 16:13:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <150f6988-6b93-487a-80cf-0050dbe46381o@googlegroups.com>
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

On 28.07.20 16:06, mail.to.rui@gmail.com wrote:
> Hello,
> 
> I was not able to follow Jailhouse development for some time now. Maybe 
> someone can clarify me with this two doubts:
> 
> #1 - Is Jailhouse still using the serial port for outputting messages 
> etc ? If so, and if you are using computers without serial port, how are 
> you overcoming this?

  - PCI-based UART cards
  - UEFI framebuffer (not as good as a UART, but ok'ish to get started)

Just recently used the latter for a box without UARTs *and* PCI 
expansion slots [1].

> 
> #2 - Does anyone have any kind of experience/feedback on running 
> Jailhouse on Intel NUC (10th gen) ? Everything working has it should?
> 

Can't help with that, but I'm also not aware of issues (which might have 
been brought forward here).

Jan

[1] 
https://new.siemens.com/global/en/products/automation/pc-based/iot-gateways/simatic-ipc127e.html

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e4c67610-0592-b5d7-f727-2ec01bf47970%40siemens.com.
