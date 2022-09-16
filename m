Return-Path: <jailhouse-dev+bncBDPYFUV7XYIBBTVRR6MQMGQEBKCSHVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103d.google.com (mail-pj1-x103d.google.com [IPv6:2607:f8b0:4864:20::103d])
	by mail.lfdr.de (Postfix) with ESMTPS id F18BC5BA449
	for <lists+jailhouse-dev@lfdr.de>; Fri, 16 Sep 2022 04:00:48 +0200 (CEST)
Received: by mail-pj1-x103d.google.com with SMTP id m11-20020a17090a3f8b00b001fabfce6a26sf8784874pjc.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 15 Sep 2022 19:00:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1663293647; cv=pass;
        d=google.com; s=arc-20160816;
        b=YobXHSohirRJLpIrkwIwbl60domnMxjmwdVqdhBfYQiEiMt0zEMV+qUVETKTadNP+A
         9ampyWHaZTjtPJ4R+ZKMK9V0Mabu5Nlb0xXk1bzFCDEzQDsuEcQIEdgi81BpjtlhRlfl
         cTM7GmCa9doDzRdG3I83/S0eGhIkev/sUIawovu0FPmSQwVqVUveAUIqRAn0LlAX9sRO
         sjIOY7+BkwrKPnJaTdzWS4ZYVia88gfSxZRsuZfpxQYKOoBhlSPu0hn530Nz5rCm04Mw
         YwCSariOCp9+3XI8xkqfLpOsGiytY88M3KrnIUhgwsYwWQ0EEQIAk8LmQtgql1+kKKCa
         f67g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:mime-version:references
         :in-reply-to:subject:cc:to:from:date:sender:dkim-signature;
        bh=F3lNzstzOz9JKr5DovUhPMwOYyjC0s1w2PC9FAAVJ6w=;
        b=ndU7Wd2FFtxqYsbZ0AZmSAwRox9zrJb6LOEGLiJHP0wsY9tQ6KXcm6mOgWEWyyR0rI
         cZX31e2EtrBhwGcW97NZnNU1HB+SeRQR/NusWLp3sAdI4LIznsKv6yFvRiy6B+O9CwKZ
         zyQYmOV68dhuk5SmW9gJtmtfxqe6AxcxICch69EXESNyfznHjBHyTfLn2z4xeEawe1o7
         xIBsuzuMuVDKcwg98ltGN1LSX9pkxF/9JrT+cOSb+40HsNoj0dI/ZKf8KtOrp9Q2xF1O
         R8jruBR6kTfCSMTsH9URXV87cv34BceisXRKCW7s61MHQjmrrFUDjcO6h1Ex8zqJ2FY9
         IcGQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@126.com header.s=s110527 header.b=Wq9mJegF;
       spf=pass (google.com: domain of windhl@126.com designates 220.181.15.50 as permitted sender) smtp.mailfrom=windhl@126.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=126.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:message-id:mime-version:references:in-reply-to
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=F3lNzstzOz9JKr5DovUhPMwOYyjC0s1w2PC9FAAVJ6w=;
        b=B+zXR6uzFVR3iNaymqCP8UuYWZLp7ebHfEqIAEl4dJoLV5D0kk7MwsUsj+AAJHlfKD
         hvBbBwIOZ8BsJ3I2Rka3fy99EbrzWY+g1Ixd9i/TGaPw01HBDDVB4g5tt4s6+15/vYjS
         407XgUX4zNAeMUysPnCt4MeG+6TtaZHZsxgYr2EJ6UcEVphNu+iaWGqZro9xyRsPknJ4
         DN3cxHMjYdE0caeGdt3wHq/Zz2WMwxSuU20ZTtoK6oG9VYa1iLKdCruXfj68ccKH3jSC
         DJflfHewO9S2wx+rri/hqu+C2AMHuaR+BC8FETyLdj9VgfvBq3qpnYibpn8T/AXAew2T
         8XIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:message-id
         :mime-version:references:in-reply-to:subject:cc:to:from:date
         :x-gm-message-state:sender:from:to:cc:subject:date;
        bh=F3lNzstzOz9JKr5DovUhPMwOYyjC0s1w2PC9FAAVJ6w=;
        b=nOeLOHdsugEQTeeLGOqkPAaMNKpLphmumRL5ut4qcr9Bm7gBrlinJlJvDG03v5b2Jl
         sn3qCfH38MSgb/e4wyXW2jHjLJzs4cWAKY9N2b3+z/qP/z2yVkw4gSANpLyGISl3vWMf
         u+Ut84eoBJsmSt0cpmjmjTAhFZj3ksLYdtaRvEm2EUirJPClE3kU4kqj9LWS973GxkQr
         B9tGfQH2r12bY2INh3JXCJ8VOQJ46A42+e5YggKKqZunQySCCAkECLFl3Mn8P2oEk6Le
         TTW02isVuzlljWX6L1qRaolsYE/QjLv3FmKWdizDDHf6c0IHCvp9JQwZKMKIDXKRqDR0
         hxTQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf0ZnZe8l5PfVpVlsAN0EFyJvmHqvkOsRaep7uxtagf1EKTJI6G2
	XsRNwyhgfmvxBlcUec0Rvgs=
X-Google-Smtp-Source: AMsMyM46S2KVm/Uw7RIP42fs5pR/9Mo8ti1ruFB5eVvS4EYXNTK2U6AtpC95NUWiVXByxvnQBoFjKw==
X-Received: by 2002:a17:903:244b:b0:176:c8ee:a5dd with SMTP id l11-20020a170903244b00b00176c8eea5ddmr2506957pls.35.1663293647626;
        Thu, 15 Sep 2022 19:00:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:55c7:0:b0:53e:419b:9648 with SMTP id j190-20020a6255c7000000b0053e419b9648ls11196728pfb.3.-pod-prod-gmail;
 Thu, 15 Sep 2022 19:00:46 -0700 (PDT)
X-Received: by 2002:a65:6944:0:b0:41b:4483:35cc with SMTP id w4-20020a656944000000b0041b448335ccmr2532730pgq.296.1663293646264;
        Thu, 15 Sep 2022 19:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663293646; cv=none;
        d=google.com; s=arc-20160816;
        b=EjsvzuqdQKT6gLVzbAE1s/2txLIVdN/KvQ7iYOQKmNZm6PiKVvJkt2hvKiNG8Yu/Jm
         9sx+Qu6mJ4F+FqC5JsZjWAMBVYObRmO7gg5bSi8fn+2aWgQajCpwAZwG241dDMHq03cR
         cp4ftY+7IaTi2AVq9LpK26nP5KeETfODmmiu/fxs4liSAOka/zbuuTDgpW7J8HHkdfxY
         beDilmF0WJ1vS8oOut/ZvhHArjfdMbNyDhAEAMXCPWDIw7ofqBfpiprI96UCdJXWm0DM
         +5Qg7JNzQC3OYpb7kbA0bYd0QMWrLlW7tKSXruhfb0EYrR7xVnzaPsfXDwo9m7uqwmwn
         60FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:mime-version:content-transfer-encoding:references
         :in-reply-to:subject:cc:to:from:date:dkim-signature;
        bh=T2kR3mgP4oYgOz1Om5LCp+84qOp/p3lbADN/6zUf40k=;
        b=0oaCQFlFE883/e0cF3a4uBCL01kx8yeilKudKdeViWymbPmVB/KuBaqnAyAYe96mGm
         vM2VrGqJnSSEpKLWzBnow6O92l67yifOZSJL5WYm+VOUSpwuJL+Ok/Rlgjfon8jUffIb
         asf+95mxgUFoqWN5uzqrtoOM1XqmWO2fGrejvdTr8Mlyr+Su18S0zZkY14pDlFV4ISFo
         YFxvxBwMeeq1UeJcx1e8MEFAWy2l3QihPVCVdM8x4qSBXEj8haMkUplAHSNWnQwNVfif
         XbhB0i/ROexuVB5JCSZuNF5q3pDgkIOCxxGp24UJJcyJi7a1AgMF+VYKh/6K0JCmLcMp
         fbmA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@126.com header.s=s110527 header.b=Wq9mJegF;
       spf=pass (google.com: domain of windhl@126.com designates 220.181.15.50 as permitted sender) smtp.mailfrom=windhl@126.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=126.com
Received: from m1550.mail.126.com (m1550.mail.126.com. [220.181.15.50])
        by gmr-mx.google.com with ESMTP id q3-20020a17090a2e0300b002025f077b2csi170729pjd.1.2022.09.15.19.00.45
        for <jailhouse-dev@googlegroups.com>;
        Thu, 15 Sep 2022 19:00:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of windhl@126.com designates 220.181.15.50 as permitted sender) client-ip=220.181.15.50;
Received: from windhl$126.com ( [124.16.139.61, 14.29.82.34] ) by
 ajax-webmail-wmsvr50 (Coremail) ; Fri, 16 Sep 2022 10:00:27 +0800 (CST)
X-Originating-IP: [124.16.139.61, 14.29.82.34]
Date: Fri, 16 Sep 2022 10:00:27 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Cc: jgross@suse.com, virtualization@lists.linux-foundation.org, 
	wangkelin2023@163.com, jan.kiszka@siemens.com, 
	"Thomas Gleixner" <tglx@linutronix.de>, 
	jailhouse-dev@googlegroups.com, mark.rutland@arm.com, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	andy.shevchenko@gmail.com, robh+dt@kernel.org, 
	"Bjorn Helgaas" <bhelgaas@google.com>
Subject: Re:Re: [PATCH] jailhouse: Hold reference returned from of_find_xxx
 API
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <f7316f94-433f-d191-0379-423c22bec129@csail.mit.edu>
References: <20220915022343.4001331-1-windhl@126.com>
 <f7316f94-433f-d191-0379-423c22bec129@csail.mit.edu>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Message-ID: <89a1b1f.165e.18344069cab.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: MsqowADnPPG82CNjwf1tAA--.52003W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuAl+F2JVlaGGMgABsu
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Original-Sender: windhl@126.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=neutral (body
 hash did not verify) header.i=@126.com header.s=s110527 header.b=Wq9mJegF;
       spf=pass (google.com: domain of windhl@126.com designates 220.181.15.50
 as permitted sender) smtp.mailfrom=windhl@126.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=126.com
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


At 2022-09-16 07:29:06, "Srivatsa S. Bhat" <srivatsa@csail.mit.edu> wrote:
>
>[ Adding author and reviewers of commit 63338a38db95 ]
>
>On 9/14/22 7:23 PM, Liang He wrote:
>> In jailhouse_paravirt(), we should hold the reference returned from
>> of_find_compatible_node() which has increased the refcount and then
>> call of_node_put() with it when done.
>> 
>> Fixes: 63338a38db95 ("jailhouse: Provide detection for non-x86 systems")
>> Signed-off-by: Liang He <windhl@126.com>
>> Signed-off-by: Kelin Wang <wangkelin2023@163.com>
>> ---
>>  include/linux/hypervisor.h | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>> 
>> diff --git a/include/linux/hypervisor.h b/include/linux/hypervisor.h
>> index 9efbc54e35e5..7fe1e8c6211c 100644
>> --- a/include/linux/hypervisor.h
>> +++ b/include/linux/hypervisor.h
>> @@ -27,7 +27,11 @@ static inline void hypervisor_pin_vcpu(int cpu)
>>  
>>  static inline bool jailhouse_paravirt(void)
>>  {
>> -	return of_find_compatible_node(NULL, NULL, "jailhouse,cell");
>> +	struct device_node *np = of_find_compatible_node(NULL, NULL, "jailhouse,cell");
>> +
>> +	of_node_put(np);
>> +
>> +	return np;
>>  }
>>  
>
>Thank you for the fix, but returning a pointer from a function with a
>bool return type looks odd. Can we also fix that up please?
>

Thanks for your review, how about following patch:

-	return of_find_compatible_node(NULL, NULL, "jailhouse,cell");
+	struct device_node *np = of_find_compatible_node(NULL, NULL, "jailhouse,cell");
+
+	of_node_put(np);
+
+	return (np==NULL);

>
>Regards,
>Srivatsa
>VMware Photon OS

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/89a1b1f.165e.18344069cab.Coremail.windhl%40126.com.
