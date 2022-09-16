Return-Path: <jailhouse-dev+bncBCT4VV5O2QKBBBEYSCMQMGQEUS4SQ5Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3e.google.com (mail-io1-xd3e.google.com [IPv6:2607:f8b0:4864:20::d3e])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8AC5BA667
	for <lists+jailhouse-dev@lfdr.de>; Fri, 16 Sep 2022 07:39:18 +0200 (CEST)
Received: by mail-io1-xd3e.google.com with SMTP id m22-20020a5d9696000000b006a1bab26d55sf4990209ion.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 15 Sep 2022 22:39:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1663306757; cv=pass;
        d=google.com; s=arc-20160816;
        b=obv/7ynSdgtKlA7N66j09YimUcwaQkLZRWscAlHruUI22dNFB7aliS+IJ6/e90BZqM
         +ZSgJQ9rlgTQLWW+ljF6nBJmOPKlF4yb0iNCI9SHMiOwSeo/6iKTsl2W8HxEbTbHF1IN
         3nvshzWOgel2uQDygHlH3Sab8bZR7OD8KNspQmdVv7/d7easfNIDkUA1CMzKnz5Qt9fX
         ODGrK4RJ/zwBkLAQUg09H7gbCdhCqbJzTiQcRPlyakXPFak/bLUbHaR0uqK6refoYUEQ
         Www9mmpuvDvbILnpqXTcfUis6zWVg9gB42RjoZ6gFyxFtumQh8txj49w30K2CLr3QYj4
         wBSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=S4Gh3haiSzKhJG0i6tKuKOzvdQ3xksibXFjwVUIl4Vc=;
        b=stRnQuoApCpNPOvO6aI5TLY1pvY9Ill0gR7N8waPtUXZ4iDC78sN6c4Ub+gq7Pd+GD
         EtojklzOGYJTHWctNlEbD/d6IDz837TWfS/FnFYDT/L3PdGKHgEkFcI25RusYkQ3jWPb
         FN/d1rAZzJ7XGe5JngYkh83GKD+MolJnhltApFRQR5bIBEiS59fVX72bG7eMiJO8zNHe
         iRWDe87X9uLxy+rvHNtgtMju284whF6sKou+10JTlvi6nnKraoKwIa0TV/yoaj255xJ5
         X9g0savrqJJxDRgTqUB0VTYG5EhJVvq6yDPmwNFQQtp8CxLSA/M2Z7ciCfpGiJT3YxUz
         o0YQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="C/8AA994";
       spf=pass (google.com: domain of andy.shevchenko@gmail.com designates 2607:f8b0:4864:20::733 as permitted sender) smtp.mailfrom=andy.shevchenko@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:sender:from:to:cc:subject:date;
        bh=S4Gh3haiSzKhJG0i6tKuKOzvdQ3xksibXFjwVUIl4Vc=;
        b=k67Hk/78s8y5ZIQhsaIVVOW0/OTto4W97VG28HRoN2UzU0xVzyUQEARCcZrxJPr/IY
         YiTjn5ClQ5g1TO9tWdZZ2U7Y+XEycvvy8Yr7IMuJaXJiANdSf4Q2MCu00yJfeenOJWc5
         phdB6O4LcTO46B+1Ai+e1mvXpa5UY4buJdgWlNDg3c/S+WhIJvxIUOrb4gwf6NFpkyqJ
         Hz19a83nmtHAIVaY/et4QXSKOk24wVFbD4RlBDlx6i8nvhftt18NBXtEudLB0du/IJpH
         +Ql8ENvDuE3aYskltdz+MdC4vVvBMREkIxRAmxOOu2OKVkYXpZ0EZetL1Jq1xzmOuAD5
         EMnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date;
        bh=S4Gh3haiSzKhJG0i6tKuKOzvdQ3xksibXFjwVUIl4Vc=;
        b=GY4jr73le5pQDhoScpknY0WdPnlcga5Bgdev8cnPusCViqbZSqLf/fOLoDdirF2U4C
         yYGUZR30Y6XSjZZTsTc4At9dRdU1xwrXp9xwD4e9xb0900T/ThTMSC/LiMELxyYYCpff
         szWqt13tvrEsEHKKQQ2v4ZOK3ZKZekINZYg3o5+plMaO7o6JLGUljuqHa8RPFRiYCzzx
         b+RVACj1XfSD24GP0yrW5PeYWJd8KKJDsWj8VO4uScWEc4rwNVJ6oAD09ozwZCNQyUYR
         T7fBcS80nmHdWZTQ8syOhbA8rKcUMzQJGfmeMB+BCpwdFJ1jV0+2Sjt48LVnFkS3xsxk
         oL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:sender:from:to:cc:subject:date;
        bh=S4Gh3haiSzKhJG0i6tKuKOzvdQ3xksibXFjwVUIl4Vc=;
        b=wTXhJfGTYrH1WcZUZ7Zi+jwFEqWx4i+12AfNHVKTxKDMZZPIds03V/3p/OLNREoQpD
         nsUMjerRT1xdL392Es01kZqJ0w7okLwR8VeuKiVrWfIBJUHMxbQVsfUaXKRLcvbHmDTK
         Hkg/E/1elrdQIg5stdi/PGl0Be0B/y0dy1lMb2CtmlM6vP1C37yVPkEKtMlR3JxG2gVc
         0WKW3QdVy4VuHXnu8KZEpofpTpB5YcDLUQ+/Wl6vjijqSEYmJ3b+BQG5ZB9rMx6HYEqR
         YZ4oq9ZS8zAYAxY6Mqegb3q6cT5Y4m4BXGneM0Bzmn72wA6tQecbcRBYUJyusxciNbM3
         yVRA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf15ai41WtSrMIXh+PTPKEVIrgvFDT9X9CFwEwarnXvaorFA40Ie
	gqCiLh7afMkjxovBPyv4LtA=
X-Google-Smtp-Source: AMsMyM4IoViEafP4XJXC8suD9G7d6/pAfR+L+Tla4AzVHLn+Vala+B3od1s8SUfELWmhXjAfXjMaiw==
X-Received: by 2002:a02:c047:0:b0:35a:5fdc:1793 with SMTP id u7-20020a02c047000000b0035a5fdc1793mr1717059jam.155.1663306757165;
        Thu, 15 Sep 2022 22:39:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6e02:cc8:b0:2eb:1346:cc45 with SMTP id
 c8-20020a056e020cc800b002eb1346cc45ls4469398ilj.11.-pod-prod-gmail; Thu, 15
 Sep 2022 22:39:16 -0700 (PDT)
X-Received: by 2002:a05:6e02:1c83:b0:2f1:2bd7:302d with SMTP id w3-20020a056e021c8300b002f12bd7302dmr1641859ill.190.1663306756177;
        Thu, 15 Sep 2022 22:39:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663306756; cv=none;
        d=google.com; s=arc-20160816;
        b=OXpugp67ZTkyi14RnkbLNxZQMLKMTOyS+8ZN32l//Rs2KqPwwyoHDOzXyllkB2cKnZ
         /zkGKA7iffFqdQZ/jUWQdOuHDV4mHYawFdHTx3rBBJRdMUp/ZhzfEdaB59VZt51PSqd3
         6RfI/KBAWzMCIQDIW7+Hve3dktOQaLZ0rJH9LBLbyrYgJfVz2sdmIlyyEzvzkrTiPDGe
         pp5HoakJjkP7dulaAD/HE1/wqa33u5ybm70QbApOAjKm3EUS9SJRs/L/Vh7ghxESrTDS
         dwjyEWwM1tFE2vHQkyXddp38DKhPZK2RGFl18RyJWOeCfa1fwqu8bIXwBEv6omUemrtH
         5hvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bGui9tpfbXaXph8yxfFfUUcX4Z55523adcOMpqhHVIA=;
        b=vRGdgyHL3DA8Wia0KA+D0lcQ+NT9V5z0dPbTdaRwu15f4q2adSJZLvr9XMQWYZw9Mw
         Be000hTU87V3p2DZzqBUaVrAN6pDK89O39NI8DObuSaCKQAJvcbkSXxqKv5EmdxP85yV
         8PyOXMlmnKSpVZBv6FZH1hPwPH4UMBH4x54fpFuUKtU2bViWHoPkvEeChfNcugK5F37m
         wZvreiySTn0mVYgz6B3LFYeslseMTzs0AvBv2YY0rqqdjvZwQ6uuDU6MDAT9KhIxDOmQ
         j8zclcjtwFCx2B+gkW6O6yhyxbywWBqmQC8mZgHXNJs0ssSDgdueGzDRCMExOMCE/ESg
         2czQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="C/8AA994";
       spf=pass (google.com: domain of andy.shevchenko@gmail.com designates 2607:f8b0:4864:20::733 as permitted sender) smtp.mailfrom=andy.shevchenko@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com. [2607:f8b0:4864:20::733])
        by gmr-mx.google.com with ESMTPS id y4-20020a92c984000000b002f4fe8967eesi12372iln.3.2022.09.15.22.39.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 22:39:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of andy.shevchenko@gmail.com designates 2607:f8b0:4864:20::733 as permitted sender) client-ip=2607:f8b0:4864:20::733;
Received: by mail-qk1-x733.google.com with SMTP id u28so12032184qku.2
        for <jailhouse-dev@googlegroups.com>; Thu, 15 Sep 2022 22:39:16 -0700 (PDT)
X-Received: by 2002:a05:620a:2552:b0:6ca:bf8f:4d27 with SMTP id
 s18-20020a05620a255200b006cabf8f4d27mr2746831qko.383.1663306755654; Thu, 15
 Sep 2022 22:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220915022343.4001331-1-windhl@126.com> <f7316f94-433f-d191-0379-423c22bec129@csail.mit.edu>
 <89a1b1f.165e.18344069cab.Coremail.windhl@126.com>
In-Reply-To: <89a1b1f.165e.18344069cab.Coremail.windhl@126.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 16 Sep 2022 08:38:39 +0300
Message-ID: <CAHp75Vd-ZdHJfjdgob7=e3X_=NQR_chWZzTiSVU64S9eTiAY0g@mail.gmail.com>
Subject: Re: Re: [PATCH] jailhouse: Hold reference returned from of_find_xxx API
To: Liang He <windhl@126.com>
Cc: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>, jgross@suse.com, 
	virtualization@lists.linux-foundation.org, wangkelin2023@163.com, 
	jan.kiszka@siemens.com, Thomas Gleixner <tglx@linutronix.de>, jailhouse-dev@googlegroups.com, 
	mark.rutland@arm.com, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, robh+dt@kernel.org, 
	Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: andy.shevchenko@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b="C/8AA994";       spf=pass
 (google.com: domain of andy.shevchenko@gmail.com designates
 2607:f8b0:4864:20::733 as permitted sender) smtp.mailfrom=andy.shevchenko@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

On Fri, Sep 16, 2022 at 5:02 AM Liang He <windhl@126.com> wrote:
> At 2022-09-16 07:29:06, "Srivatsa S. Bhat" <srivatsa@csail.mit.edu> wrote:
> >On 9/14/22 7:23 PM, Liang He wrote:

..

> >>  static inline bool jailhouse_paravirt(void)
> >>  {
> >> -    return of_find_compatible_node(NULL, NULL, "jailhouse,cell");
> >> +    struct device_node *np = of_find_compatible_node(NULL, NULL, "jailhouse,cell");
> >> +
> >> +    of_node_put(np);
> >> +
> >> +    return np;
> >>  }
> >
> >Thank you for the fix, but returning a pointer from a function with a
> >bool return type looks odd. Can we also fix that up please?
> >
>
> Thanks for your review, how about following patch:
>
> -       return of_find_compatible_node(NULL, NULL, "jailhouse,cell");
> +       struct device_node *np = of_find_compatible_node(NULL, NULL, "jailhouse,cell");
> +
> +       of_node_put(np);
> +
> +       return (np==NULL);

This will be opposite to the above. Perhaps you wanted

  return  !!np;

Also possible (but why?)

  return np ? true : false;

-- 
With Best Regards,
Andy Shevchenko

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAHp75Vd-ZdHJfjdgob7%3De3X_%3DNQR_chWZzTiSVU64S9eTiAY0g%40mail.gmail.com.
