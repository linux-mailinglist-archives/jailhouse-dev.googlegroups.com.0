Return-Path: <jailhouse-dev+bncBDPYFUV7XYIBBJPRSCMQMGQERMOH4HI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3c.google.com (mail-yb1-xb3c.google.com [IPv6:2607:f8b0:4864:20::b3c])
	by mail.lfdr.de (Postfix) with ESMTPS id BE96A5BA888
	for <lists+jailhouse-dev@lfdr.de>; Fri, 16 Sep 2022 10:49:42 +0200 (CEST)
Received: by mail-yb1-xb3c.google.com with SMTP id v5-20020a2583c5000000b006964324be8csf18181398ybm.14
        for <lists+jailhouse-dev@lfdr.de>; Fri, 16 Sep 2022 01:49:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1663318181; cv=pass;
        d=google.com; s=arc-20160816;
        b=dAzQyh2NURVW5aLrPMcZNmxZvL4SYkyo4PryLcwDv5+N4l6rVZ2Mkx0UDttK2qQZtx
         QCS/PEQb7kD5YAMD2xMN5SXqqbD5kOjvTeVocC2+qYSv5H0vy0CeS3Cxxe5SinNLsLCg
         OELM2Pqrdqb2WCg7pcNFEAM20YswH9OwGH5bnqKwxT0sXkWlcAI2NDmGeV0Yt1d7Q0pV
         nVONIit5npFOKCc7LLUO5fIMx0/hAdihX3LmSOmbaBzlwpidO0CPULmdOLWeK27C8922
         /8YDSieWx06/1INzIQcEKJfyfCQkERlQJUDiWKdvZVryDwTS7VuELvOEaSyRN0+ki6Ay
         D8kA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:mime-version:references
         :in-reply-to:subject:cc:to:from:date:sender:dkim-signature;
        bh=N99C1+q/QLyL5i1IHZaxFfrOA0uexReZxuCVd0fpTi4=;
        b=gVB0O20vjrI0uOK+VXePiXceapTE0yaXQlzRm5MPx/Af43Tg/RgUhndpyB9TaX6A1d
         caM5CvLsbxacRNCScyGwNDK1Rfx/yUf2TUelFfI27z3u7yZ/JKiDsHBDvXg8OI/vgIwX
         UnKlsLWblhXwEjey0ZxXXgQJGdTM9WN/RKm3QtJmxBwSxqpmwJJqg0Nh9BAz/9LtK5PM
         FC/e3n0kmt7xiJtSm8tnKxqHoeAqV0rGyW991S46CtveVVu4IujZt58lQbvQTN+VBDpc
         reIeqEMu4RTaDJ+qRu6mXzsEKlm1qPK/YdwTGUz4J+THNpUMTqE/JKjVxiEmEFQHLXZs
         iyHg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@126.com header.s=s110527 header.b=EZbkZ36+;
       spf=pass (google.com: domain of windhl@126.com designates 220.181.15.64 as permitted sender) smtp.mailfrom=windhl@126.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=126.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:message-id:mime-version:references:in-reply-to
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=N99C1+q/QLyL5i1IHZaxFfrOA0uexReZxuCVd0fpTi4=;
        b=kQ59ReH26Zhq2ViYpJis+dRNou/kQqpcpkNd3hn30C1RgDddeCVTXWT5MAFXK04kNc
         3B7uFhiXtcMtuB0lo8ho98KRtoWOtzDBRo5FNn4ElMI4htngUyGuMYpHyAOu2zau0x+Z
         VbSdMuI7KzlsJskhZYah1Itmz8I2uVsjSCN3JIondP0NymT+qjGfxRCQRrimt6GSWVaA
         s7Go6iQoPJ9hd9Ji055XTv3K8V/XB4tb7qGXPim6KYJwO75qFHWYWnWoPqOOE5zBBxKP
         RgF8jYH4AeCYsBjRL/i82zqTkwHRnqlFjIoz5i96caAJpjAiXrd0dGiqxyB/OmW4RaoD
         +dTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:message-id
         :mime-version:references:in-reply-to:subject:cc:to:from:date
         :x-gm-message-state:sender:from:to:cc:subject:date;
        bh=N99C1+q/QLyL5i1IHZaxFfrOA0uexReZxuCVd0fpTi4=;
        b=UeYzCPLsKRGPHRfjyyazak3pEj3lprLzK37Y2ufgBHMNcJiUngNWOWvoggNsTIK9vh
         grL826qL1kXhZwwfdsuZh0EebkPnvO0P6YUGg3kpezpgsIlWc30kdatkGEbdj8GeZrNi
         LMCJR5hJtviGg4nssoQP5mObhyjBeHV0txiGkeLelftEHd4svkxMxO96/DtVO54pEstw
         bdik3OpXHmhvGALwudrQeNfBodXylLbzBc1sE9KhPkBxp6UfFucga0KrCE+uc81VNpzx
         5btZuj9GmMxY64qIMFQkbu+jmisa5JnKwF1VjXtKP5ksGRzaaCb5xy9MhtdbxK5FYy6s
         dndQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf3SXQU/3NGYkwc5WkpHyWpgohvaVPwV6skdlu6mPML71W46HMBD
	ycNWAhytuHXMssX380ebUF0=
X-Google-Smtp-Source: AMsMyM7DacpBb2UeHFiKWYc9vEPYlnvOX/t17xQIX2cAboBVms2xITRtZDvpp+/wZ5mkUeLPu4CTmA==
X-Received: by 2002:a81:ad55:0:b0:345:7c3:110a with SMTP id l21-20020a81ad55000000b0034507c3110amr3626611ywk.36.1663318181735;
        Fri, 16 Sep 2022 01:49:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:a105:0:b0:6a9:296a:377f with SMTP id z5-20020a25a105000000b006a9296a377fls12198081ybh.8.-pod-prod-gmail;
 Fri, 16 Sep 2022 01:49:41 -0700 (PDT)
X-Received: by 2002:a25:6c3:0:b0:6b0:4336:9d81 with SMTP id 186-20020a2506c3000000b006b043369d81mr3418685ybg.119.1663318181005;
        Fri, 16 Sep 2022 01:49:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663318181; cv=none;
        d=google.com; s=arc-20160816;
        b=m6aLKc6u5IvDV6PjLt/t8rgt7j9jNr6T1DQtMfF2owTPym+ryIGrfVvb5s4hT1pBtV
         XxhpTGvRcrX68WblFkQmzvEDSD9QR2mb3vlDuOK2RNb6mA8ejDhoPpyoQKAidwqjbAua
         UOYs39uDsaP30K5kU421+iiJhYte7YMVVwc1XISEDs1RM9Of6LpJNycQRcUoH4Xi+CoZ
         2RjaMGVG306ys5CpbnbYqS4BXzxqu4ilQphaSrq+VSKuzUYBtwdUlHYyVA8EvAZeQMfz
         9iXX25Ec/n71GGr0+8RzooVREhgWfdOjczFnoRcZJxlkTKoHKohey7lKyN6CZe1N0NWY
         mhBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:mime-version:content-transfer-encoding:references
         :in-reply-to:subject:cc:to:from:date:dkim-signature;
        bh=d6Wq/2ivwvnyr4ADR2beOa2uNb2xEl5W8NXuJb3npto=;
        b=ROZ/k01dXuXN4j6GXXkg3cRU7TtQmKB8JQMpAFP2DgHGl/IvOSD1TfbZKOPQe6Fb3B
         X2hwxSYc2dbQm9rQn0NlXoglLiFqpPx9pjrwPRHsysp0MofF0ONqiE75GkOEk6pi8JxF
         DhZI30U5tCZSOKE5Eu87Xkb04YsR++NHvsYVqUQ77jPh64vAULOhOou/X7kEj+h4kusT
         xdblKORzemhdcccDmAPaq4LnzTtVTljo1/+rjRQXVy9hsi/9Kvs16/MlImKIhoO/bmif
         Ec+/PfTkpYxJC5xEjhJAsgLnlf9+bDY/i173iRWq+TJ57rmG/RWKSOjoCajnS69h/WDb
         pbSQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@126.com header.s=s110527 header.b=EZbkZ36+;
       spf=pass (google.com: domain of windhl@126.com designates 220.181.15.64 as permitted sender) smtp.mailfrom=windhl@126.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=126.com
Received: from m1564.mail.126.com (m1564.mail.126.com. [220.181.15.64])
        by gmr-mx.google.com with ESMTP id ci24-20020a05690c0a9800b0033dca312115si324175ywb.4.2022.09.16.01.49.40
        for <jailhouse-dev@googlegroups.com>;
        Fri, 16 Sep 2022 01:49:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of windhl@126.com designates 220.181.15.64 as permitted sender) client-ip=220.181.15.64;
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr64
 (Coremail) ; Fri, 16 Sep 2022 16:49:22 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date: Fri, 16 Sep 2022 16:49:22 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: "Andy Shevchenko" <andy.shevchenko@gmail.com>
Cc: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>, jgross@suse.com, 
	virtualization@lists.linux-foundation.org, wangkelin2023@163.com, 
	jan.kiszka@siemens.com, "Thomas Gleixner" <tglx@linutronix.de>, 
	jailhouse-dev@googlegroups.com, mark.rutland@arm.com, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	robh+dt@kernel.org, "Bjorn Helgaas" <bhelgaas@google.com>
Subject: Re:Re: Re: Re: [PATCH] jailhouse: Hold reference returned from
 of_find_xxx API
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <CAHp75VfQHnt2YxuxbFo96tfDrHEZpEqSFKFV_D7ERe6uXEnvEQ@mail.gmail.com>
References: <20220915022343.4001331-1-windhl@126.com>
 <f7316f94-433f-d191-0379-423c22bec129@csail.mit.edu>
 <89a1b1f.165e.18344069cab.Coremail.windhl@126.com>
 <CAHp75Vd-ZdHJfjdgob7=e3X_=NQR_chWZzTiSVU64S9eTiAY0g@mail.gmail.com>
 <7f9efc57.4645.183451f5b84.Coremail.windhl@126.com>
 <CAHp75VfQHnt2YxuxbFo96tfDrHEZpEqSFKFV_D7ERe6uXEnvEQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Message-ID: <480230.5e6f.183457cfc63.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: QMqowAC3v3OSOCRjZ6ZxAA--.63751W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7RV+F1pEAufFlAABs6
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Original-Sender: windhl@126.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=neutral (body
 hash did not verify) header.i=@126.com header.s=s110527 header.b=EZbkZ36+;
       spf=pass (google.com: domain of windhl@126.com designates 220.181.15.64
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





At 2022-09-16 16:46:36, "Andy Shevchenko" <andy.shevchenko@gmail.com> wrote:
>On Fri, Sep 16, 2022 at 10:09 AM Liang He <windhl@126.com> wrote:
>> At 2022-09-16 13:38:39, "Andy Shevchenko" <andy.shevchenko@gmail.com> wrote:
>> >On Fri, Sep 16, 2022 at 5:02 AM Liang He <windhl@126.com> wrote:
>> >> At 2022-09-16 07:29:06, "Srivatsa S. Bhat" <srivatsa@csail.mit.edu> wrote:
>> >> >On 9/14/22 7:23 PM, Liang He wrote:
>
>...
>
>> >> >>  static inline bool jailhouse_paravirt(void)
>> >> >>  {
>> >> >> -    return of_find_compatible_node(NULL, NULL, "jailhouse,cell");
>> >> >> +    struct device_node *np = of_find_compatible_node(NULL, NULL, "jailhouse,cell");
>> >> >> +
>> >> >> +    of_node_put(np);
>> >> >> +
>> >> >> +    return np;
>> >> >>  }
>> >> >
>> >> >Thank you for the fix, but returning a pointer from a function with a
>> >> >bool return type looks odd. Can we also fix that up please?
>> >>
>> >> Thanks for your review, how about following patch:
>> >>
>> >> -       return of_find_compatible_node(NULL, NULL, "jailhouse,cell");
>> >> +       struct device_node *np = of_find_compatible_node(NULL, NULL, "jailhouse,cell");
>> >> +
>> >> +       of_node_put(np);
>> >> +
>> >> +       return (np==NULL);
>>
>> >This will be opposite to the above. Perhaps you wanted
>>
>> Sorry, I wanted to use 'np!=NULL'
>>
>> >  return  !!np;
>> >
>> >Also possible (but why?)
>> >
>> >  return np ? true : false;
>>
>> So, can I chose 'return np?true: false;' as the final patch?
>
>Of course you can, it's up to the maintainer(s) what to accept.
>
>-- 
>With Best Regards,
>Andy Shevchenko

Thanks, I will do it now.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/480230.5e6f.183457cfc63.Coremail.windhl%40126.com.
