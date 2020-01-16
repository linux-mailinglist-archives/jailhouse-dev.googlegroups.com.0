Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBEVTQLYQKGQEURSRJ7Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E3913E517
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 18:12:51 +0100 (CET)
Received: by mail-lj1-x23d.google.com with SMTP id k25sf5373146lji.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 09:12:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579194771; cv=pass;
        d=google.com; s=arc-20160816;
        b=rxS4Qx+MYqQ4RTSCl/ZKFp+AO1/wT43Gb1U3ikOAOe7fgJ3vFOAz4hnu6xySP3vNve
         KCyOMsWfcn1QPttBTtTXtYO2Cg5c0qC0JoJY6Seeg+fGb3EdjL87RP+HtZgBgElEIpLR
         5JTfna12Jxox2ITR1MagsPO74GH88TpQuo+/pOWNm9cQvbuSRJ9pfeJiGmOKP1DhjozI
         N6SjL4AlPgReBxPCyd6djqZP7nQQI6eS0AGODao5QnySwlJ5TYivomTVrwsPOMkrb0pJ
         wAjveEDOWbQL+fYA2sxUQLMHWxpMkCNfhzvKuc/rjM2/TQGwsxWfwYElEoux9Zzu5uQ3
         rVSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from:subject
         :sender:dkim-signature;
        bh=dlpm5Hoe/XiOdR0umfOih7VFCj8Kjju3aDmdyVdrYfE=;
        b=tHJH8Zln3s+aXA3WeYGzUXVJpbD/3MYJaAsvdcCnKu4z8Xod975SDna7vQmELef2hr
         O5rt1ZfonO49YeuJtnHkVw6FHW1ra8FzHBOr1XI4eDfQ3TwtIczgIEbzr5JG80O99hDm
         6qlYLjmN3ci8ZZ6LR6uKvuZmRTzfLBHuaJh009HeI5fKRgPc2+UhiHFV1lgP6rBuWm4P
         Xk1hqMHY35wtZo3MtIeOUe1Gy0cXIfdZAcooyL2GvaSGZfOp5rmSCkllpuUgFVG+JHH6
         RpDOkL9rjBdsRrg1XAtkfWWS83dNNCrV9UiZedQTEkseEQd0yKjrzHIrlkJ56HC/EKkU
         Mdqg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=dlpm5Hoe/XiOdR0umfOih7VFCj8Kjju3aDmdyVdrYfE=;
        b=mhANi0cf9Bp9XlXaNmlmEZtyECOxqR/7upC6ATtNnF0weT86FpUDTKKjVZCshiQPW2
         SBAUe0DKK5B3afS+8+/WvsTEw7st2itrakDg0bckl5JHMYzcrsBj+Zwk1ptMLOwZzBVr
         jP3QEuFq0cl9cy8KnJpy0/S+ie8sK25y39lMCHa2/3S8P0N1wCYM5oT2CO27NI5af/Xk
         IKCFLTHEM9CjnxNxplgHoNqmTMSjpVWuYATdl7rJcSsplfrsp6yF7XbycSWl6ry14/ee
         05Bwab+cswNGZIu3Adt7mtdZL2FQM2zsMUO/1p3UOEu1l4FAGtU8huvz9r6SndPOy1IG
         j+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=dlpm5Hoe/XiOdR0umfOih7VFCj8Kjju3aDmdyVdrYfE=;
        b=qlRIv+0mEs1bVRqKpoPLsWUioxSsoMj2Hy4Hq4sfpNBr87XBF+gOZzetn/bc684hz2
         fFnMY7ZcJJYMuj7yI5MBTx7V8LS/A0jziqCnz6+zkbPBtTxw1dlAlVmwgcW1SzNn6jIA
         hdjMX+3RHmGLgtNoLWI8cTw2+C/fj8bXjFVfNe7KpIrB2eyjkmU/FFhRXuKfr/j2nc9t
         H11yHbMWVnfV7uZRbKX73cY0eICJqb8ML+yiKwCSPjc/biSmilsh8ONjfSMKBPRZnS5U
         p8tUJQg7M8T37y7+SdbVid2A3p+ObYuxVty1qkkQ16ezdOXnDNtil2YzvyMPummFdDiR
         3M8g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVEbz1FJbSKZdUuoOMMyZF3GYJNF6yE/DdLie4FUmriErQHqG1f
	8tJAe72OOKVECUy0u2w93Oc=
X-Google-Smtp-Source: APXvYqwCDF+vYm2lE0WELVtuijn09HJvruuFG0r/zKg+jDU4q/SmI4LtKrEE1S8TLwGF9idDctD1KA==
X-Received: by 2002:ac2:42ca:: with SMTP id n10mr511474lfl.215.1579194771063;
        Thu, 16 Jan 2020 09:12:51 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9709:: with SMTP id r9ls3199916lji.14.gmail; Thu, 16 Jan
 2020 09:12:50 -0800 (PST)
X-Received: by 2002:a2e:800b:: with SMTP id j11mr3031757ljg.126.1579194769923;
        Thu, 16 Jan 2020 09:12:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579194769; cv=none;
        d=google.com; s=arc-20160816;
        b=ihATu+oBltzJWiADthWQ4jBHeyeYY8FSfAEzknfCBQLwT+rguCgFbP5bo9saxEPVpF
         SP8XcvTgcL4aiijoRD2lLwwgYOd4yyILXSKNHZvUXMJpj3HARDbSOHCmr+D5R3F7nLoj
         2p8x9tniJWBN4DY3yVXc7FfDudoAPlk/xk+zplkJ+scHhPZg/DYUe3cAkZm/7kHned6y
         N7azgIUb+YI0zlevseYDaHP8xQOZDEFsd3L3xZc6OF6jNM1s9vX1mL2Y7cM+daKOepvQ
         DPiyvYYVQ8gJIMLBj7RZCY1+pzYfK5Rn0scYyYKLvi0VnxSJeCjajC8GVzv6uE0hwLbv
         H7ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=4BSLrfNQJueAtlrQjLThRMeDxzMFpXlLSSRpxOQ1oeE=;
        b=mXKgC79MONrKutjrbqiD6+8/kSYfr8L11At0GBwWkHm0xnG2uFvyX61LoKRQui/hmB
         k/UYL3dm4nIHPbyAUX+NwnnVT/PYFfZOmz1GrPZQ1xki52y5jXjcE4gjwyVwVhlVGibW
         TryH5WRLr9Ut+kuIKMqd0I/X0eqjzqXBcVwWCSgR+RjWnuvYbxTr2stvWo8HDKcpEkuW
         btcGsCqOCyGbwNJQ7jqkHTzDu0wiKAkrvJMK7VZbkdUsxF2XBfA81u6oI4Y/ai2W0uKD
         hxEBuKswxa6na2rxghaBrwtdCywa3q/AqebkkFfGMhH4O4Bo2eCviPVnqtU8IwPqWI2+
         crAQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id j30si1222376lfp.5.2020.01.16.09.12.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2020 09:12:49 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 00GHCnCg002325
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 18:12:49 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 00GHCm6t028745
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 18:12:48 +0100
Subject: [jh-images][PATCH 19/18] ci: Filter out rpi4 target from -rt test
 build
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
References: <cover.1579170887.git.jan.kiszka@siemens.com>
Message-ID: <edba3e4c-3d1f-784e-c641-9282f40c093b@siemens.com>
Date: Thu, 16 Jan 2020 18:12:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Not supported so far.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9c94802..b91f2dd 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -16,4 +16,5 @@ all:
     - export KAS_TARGET
     - cd ..
     - kas build jailhouse-images/kas.yml
+    - KAS_TARGET=$(echo $KAS_TARGET|sed 's/mc:rpi4-jailhouse-demo:demo-image//')
     - kas build jailhouse-images/kas.yml:jailhouse-images/opt-latest.yml:jailhouse-images/opt-rt.yml
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/edba3e4c-3d1f-784e-c641-9282f40c093b%40siemens.com.
