Return-Path: <jailhouse-dev+bncBDPYFUV7XYIBBPWBSCMQMGQEKSHLNYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3c.google.com (mail-vk1-xa3c.google.com [IPv6:2607:f8b0:4864:20::a3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE2B5BA723
	for <lists+jailhouse-dev@lfdr.de>; Fri, 16 Sep 2022 09:07:44 +0200 (CEST)
Received: by mail-vk1-xa3c.google.com with SMTP id d74-20020a1f1d4d000000b003a258b134b8sf4016464vkd.12
        for <lists+jailhouse-dev@lfdr.de>; Fri, 16 Sep 2022 00:07:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1663312063; cv=pass;
        d=google.com; s=arc-20160816;
        b=mQ7+kE0XYQ3vAbhLfsprCnJLJ6egrfBrTCpZaDqcdJ9hrGS9QIfjwzojLFdXAxzIq0
         OyHrqdpQnlEB2YX5klXs4koCfb2zSvSyFMF0hn7UBpletjZGPUf4fhKVTvBh/8+2glDk
         9a/i/adfRmOblFPmMsM6lIVuOc/de99QxTVOHBxEiZwFLC3BKwVHWFD+B9KMNmP9VnYr
         OvPT5HqpVZ5lGYnWoQ4asF6TAg6MVqJpU8vauD6kGNDupxE8lXkXzgqbbuFHiiUE11cN
         mz+bO3Q6WiehNgZgabqJG9Hy9qu8+U8EfnqFU4eTItC3JB4+sri5mgV9LRzSMR9N/bca
         aS8w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:mime-version:references
         :in-reply-to:subject:cc:to:from:date:sender:dkim-signature;
        bh=Q1NY78/ofjsicpa40x7qyMXR/Z5vTtb1xDCiTBP9BY4=;
        b=LOd04WPCGNxqXU5v5efXNEpYPRFTd353GXbNxGbabf9SEGsEgCUBQBTEJGdBvoKV50
         Kw+DVIX9wvU1EpX0FBKEXtzkaunkNXhhHPimO0Ec7eI5iELn81QhTUzX3r3XDebRUYmZ
         /zPd2B7L+YTNQvmfU6F4X7CS/4nakRTAe46ZV5w1ZOQ7B/NzX8mnNwEYOPGx27blQ6+3
         0WmFYWejVgVhqojbH3qJCNmTDNqoe0J51HwkIFS7VgjvkADatdu9Evt+XRtAsai3OyY6
         ht4jBlXT/IUpNWVoA2HB4E9Dd1/86hvwNBUZ81kSrb7blKa1cWTMli89XqEW0GCTQY03
         GeSA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@126.com header.s=s110527 header.b=cbO3DoBC;
       spf=pass (google.com: domain of windhl@126.com designates 220.181.15.64 as permitted sender) smtp.mailfrom=windhl@126.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=126.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:message-id:mime-version:references:in-reply-to
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=Q1NY78/ofjsicpa40x7qyMXR/Z5vTtb1xDCiTBP9BY4=;
        b=TN8O1UjBQpORA71cKP0o/GxldzFOutQ+YlxnM+/Nt19kIUQwT6RVLQZ3uSYZWH2pa+
         Fy2hUYtbN/zL1Nyq28exsSMLxwGeL5r1FvhGpz3MJfDXRkr+3SGQIz/KPwebe9C/RP+/
         kloNo0X3SbOwmRKyEI1wUvqvy4LqDumqk1REPuEtkWiCiNu9i4HPBsKaIro/UScJOk9N
         YRvOmqTGCTPOtClAQNZdHssqKBcA0YRUXv5J45UZXPKRq1XZegJLI4ico5ZZ4gaET3GS
         1xP3gVTO+6ZD2uI3FBACltoTlN6aLN9Dxqf+mJDxqisXfWoFSScZW6GIUlg7/VEAS8cE
         064w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:message-id
         :mime-version:references:in-reply-to:subject:cc:to:from:date
         :x-gm-message-state:sender:from:to:cc:subject:date;
        bh=Q1NY78/ofjsicpa40x7qyMXR/Z5vTtb1xDCiTBP9BY4=;
        b=MjIYAOw/1xc/qqhEcG0Pj7nlNg1+MwturJ0ETDslWVc5qE4u3IcREmq69Tc6K55hFK
         Xco38Tjus+lCjqHkqe25hNrNoWyz8OpF770L+PoWZGUgvzp5Z8UxmsxnmP3VMYQNlGro
         Yg6ypLHswyTbdizelARicr/SndAKx4JZnfu7VkzUkMutrN6aH9h1d1lW8vxwI7HEKpKd
         GFBo14I+sf90bzh3uZTzjdyPJyDx4U65nmSlDLwBWw9FdxjcA6fWDCAVgn+NlKugc9vK
         Mlm3UiP4xQ14m0yNDcaVxm1PofBj66KRZAw8Boh7AYZMGgXCFw1iZthnQNdfwpz1/XvA
         /c+g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf2lCl7OCIRA+/7PAbPReqLp980+lFGqBauxqPpROZvTFYKCmI75
	+1y4q1k4I2zPQi4m5bffkcQ=
X-Google-Smtp-Source: AMsMyM7gLFVYt8WMxXrf02JhJWbivvAYdgHXhLXcfTGZesG9yopKa3YLTUxB12tP4GPiXbC2t9J9Aw==
X-Received: by 2002:a67:b84a:0:b0:390:b482:92ae with SMTP id o10-20020a67b84a000000b00390b48292aemr1419113vsh.52.1663312063299;
        Fri, 16 Sep 2022 00:07:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6130:80f:b0:3bc:cfde:8672 with SMTP id
 bn15-20020a056130080f00b003bccfde8672ls521630uab.7.-pod-prod-gmail; Fri, 16
 Sep 2022 00:07:42 -0700 (PDT)
X-Received: by 2002:ab0:205a:0:b0:3b9:6864:8fbf with SMTP id g26-20020ab0205a000000b003b968648fbfmr1350909ual.99.1663312062364;
        Fri, 16 Sep 2022 00:07:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663312062; cv=none;
        d=google.com; s=arc-20160816;
        b=dPVUH2EQtuzOlK9aum+gWVsYGviYDH5b62LEGcJmhf727MakhJEMSxnGZqPOMU0TJR
         axFnI1ZQ0cYPnx/adFQYFp134++wVuvShXQV62gzIQH3dvLqRu2PGZhS+KMXG+uRcON6
         gpb9HqJMubo1u5Kn0OoQl9UjpgsKgd7wNbQMI+CeE2xuUgvRhr86OkZNlLrJ4HpyZh5c
         Y/dULJIuiXBDE5M+64yj+UZR9ywGMoU+bn1vD0cL1qy27y9CGkdP+PrHRhmEtp+mjAH8
         YGIm36E1oTYZ08ZyVTM/wBx58EBIu2ll+TRHGBgGedC1fdwFQAHt7EFIerEgexl1RQx+
         YRgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:mime-version:content-transfer-encoding:references
         :in-reply-to:subject:cc:to:from:date:dkim-signature;
        bh=J9yBYbsHeprzAm37Y/G8jAhb3IaaELswHP/bvZzZ7JI=;
        b=VVVWrCdQLXW+VIK8PLPtO/FjcoIFv8LfRyrFCR+6Kfzhnva4JKjepoXKkZ+hayr94v
         UCeD4t4iOVzEfu4DXA6CY+V8mgnyI7s5jt8d0TkoRuhO3ZvqBTut0uzFf/g3XoShqMT6
         X3V9DBvyFJaxzNQ/7PdfzsD8JRg0sirqyPT3dPRbXqUXDywA+O0rY74FQxnjyPMcLEfd
         G3OSTNicBLVPvjo2aKVBjarvdMu+IOVn2QHBXD7pIx0+0FoE91/EeUYqrl7vnJjWqqpe
         Rc1hUa8KEm+oTBG0xaZz85gN9GQQqYQC2bbksNaS29pFDMxHskVatoyW8IBlnBtxX5g7
         dpHA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@126.com header.s=s110527 header.b=cbO3DoBC;
       spf=pass (google.com: domain of windhl@126.com designates 220.181.15.64 as permitted sender) smtp.mailfrom=windhl@126.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=126.com
Received: from m1564.mail.126.com (m1564.mail.126.com. [220.181.15.64])
        by gmr-mx.google.com with ESMTP id u7-20020ab03c47000000b0039f9087ee0fsi537728uaw.0.2022.09.16.00.07.41
        for <jailhouse-dev@googlegroups.com>;
        Fri, 16 Sep 2022 00:07:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of windhl@126.com designates 220.181.15.64 as permitted sender) client-ip=220.181.15.64;
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr64
 (Coremail) ; Fri, 16 Sep 2022 15:07:06 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date: Fri, 16 Sep 2022 15:07:06 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: "Andy Shevchenko" <andy.shevchenko@gmail.com>
Cc: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>, jgross@suse.com, 
	virtualization@lists.linux-foundation.org, wangkelin2023@163.com, 
	jan.kiszka@siemens.com, "Thomas Gleixner" <tglx@linutronix.de>, 
	jailhouse-dev@googlegroups.com, mark.rutland@arm.com, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	robh+dt@kernel.org, "Bjorn Helgaas" <bhelgaas@google.com>
Subject: Re:Re: Re: [PATCH] jailhouse: Hold reference returned from
 of_find_xxx API
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <CAHp75Vd-ZdHJfjdgob7=e3X_=NQR_chWZzTiSVU64S9eTiAY0g@mail.gmail.com>
References: <20220915022343.4001331-1-windhl@126.com>
 <f7316f94-433f-d191-0379-423c22bec129@csail.mit.edu>
 <89a1b1f.165e.18344069cab.Coremail.windhl@126.com>
 <CAHp75Vd-ZdHJfjdgob7=e3X_=NQR_chWZzTiSVU64S9eTiAY0g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Message-ID: <7f9efc57.4645.183451f5b84.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: QMqowAA3P3ObICRj6YNxAA--.57196W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizgd+F18RP1kgPwABsW
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Original-Sender: windhl@126.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@126.com header.s=s110527 header.b=cbO3DoBC;       spf=pass
 (google.com: domain of windhl@126.com designates 220.181.15.64 as permitted
 sender) smtp.mailfrom=windhl@126.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=126.com
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




At 2022-09-16 13:38:39, "Andy Shevchenko" <andy.shevchenko@gmail.com> wrote:
>On Fri, Sep 16, 2022 at 5:02 AM Liang He <windhl@126.com> wrote:
>> At 2022-09-16 07:29:06, "Srivatsa S. Bhat" <srivatsa@csail.mit.edu> wrote:
>> >On 9/14/22 7:23 PM, Liang He wrote:
>
>..
>
>> >>  static inline bool jailhouse_paravirt(void)
>> >>  {
>> >> -    return of_find_compatible_node(NULL, NULL, "jailhouse,cell");
>> >> +    struct device_node *np = of_find_compatible_node(NULL, NULL, "jailhouse,cell");
>> >> +
>> >> +    of_node_put(np);
>> >> +
>> >> +    return np;
>> >>  }
>> >
>> >Thank you for the fix, but returning a pointer from a function with a
>> >bool return type looks odd. Can we also fix that up please?
>> >
>>
>> Thanks for your review, how about following patch:
>>
>> -       return of_find_compatible_node(NULL, NULL, "jailhouse,cell");
>> +       struct device_node *np = of_find_compatible_node(NULL, NULL, "jailhouse,cell");
>> +
>> +       of_node_put(np);
>> +
>> +       return (np==NULL);
>

>This will be opposite to the above. Perhaps you wanted

Sorry, I wanted to use 'np!=NULL'

>  return  !!np;
>
>Also possible (but why?)
>
>  return np ? true : false;

>

So, can I chose 'return np?true: false;' as the final patch?


Thanks,


Liang




>-- >With Best Regards,
>Andy Shevchenko

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7f9efc57.4645.183451f5b84.Coremail.windhl%40126.com.
