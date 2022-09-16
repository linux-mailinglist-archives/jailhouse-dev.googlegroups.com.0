Return-Path: <jailhouse-dev+bncBCT4VV5O2QKBBEPQSCMQMGQEMV66QHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3c.google.com (mail-yb1-xb3c.google.com [IPv6:2607:f8b0:4864:20::b3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5DA5BA873
	for <lists+jailhouse-dev@lfdr.de>; Fri, 16 Sep 2022 10:47:15 +0200 (CEST)
Received: by mail-yb1-xb3c.google.com with SMTP id q84-20020a25d957000000b006aeb2dba911sf15483179ybg.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 16 Sep 2022 01:47:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1663318034; cv=pass;
        d=google.com; s=arc-20160816;
        b=zb0XkQZ37/i5y42neSr5qr4gSRnwzDkeVtx6inSo1VfzGWwVHg79/M0ae9KoTN6ySJ
         FAN9IlNAOLVr9JS9kYM2l2GlPnGKksbcE6Jn64Kk6xyCPiza6b2s4fMx4T6RZgG2KV8a
         c782Jcm9cmXbK8QU1A/FbUtEx3sqlU2/JpigMDECsnnJJSKc03eMPMjstGwNMVcyvLJt
         RcQk5X9Tn0I4JAqS+dOw4jmpfOO73bdYljjaDHTO0RbPqLj5NLhAYWzYkhSB8m0WioOZ
         V3rFa4aDWjF8BkQFrOP3++DkVnUmXTmaKe+lAWL/CbVB89sCSAXwzYzFK2/Uogs+iXiE
         6gMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=3+8OSrLcmT5XsGgTMG/orQJ0QISqZiP0FRvDMm3UG4g=;
        b=GJ3vEnlIR6wK74qCqYlirDHaWGyNc4v5K+lTtAF8pXrCrZg2QRs0oUIGgunj3iI7Mn
         Jj2wGjHH3jKjdfOcITZa1heOOr5cFjyTtY7XIyxcizUP1WdEQnfq7MrGvFKeEnBWHDQ/
         FyETZbsGpY3i3XarrwxYGb4yIz8XjT2zsRt3F2U27t6ghNhX1vIuGouvINST3dOro01y
         PF5QlCE5EFfAyuWCqdYLuLK8Zt8ynUTiyrfup1tNNzHRNCefDdDRojYEm0AYV5qiTno7
         1hAxEIJwyI+bzVRd2pjPptc5zKtz5UHH56dGeNQ/t8JeHEtsG0MHDPoJABzd5SR/KcsB
         xoXQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=FJi75foO;
       spf=pass (google.com: domain of andy.shevchenko@gmail.com designates 2607:f8b0:4864:20::82c as permitted sender) smtp.mailfrom=andy.shevchenko@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:sender:from:to:cc:subject:date;
        bh=3+8OSrLcmT5XsGgTMG/orQJ0QISqZiP0FRvDMm3UG4g=;
        b=nfZ6YqYyftqUNl0pqxaCPz5wnGbzjIKKDOT8VGEJOKvfJQTlN9N8C/T6QDD5S/4Q+H
         9ns04CW2xo43MUKzeXdbblLmqU4DXqpdyabwSfk/uu/yTS7DtNLA8Wr8ngOFVNyIoM9I
         G708YrvRpTb/5t8ElagR4GKqSTgK5z9qp9/6ituD7YS/x+LGFxhPN93w6V1T21OGxq4D
         UjadqgXv77CTZU2fdEPvtfruN+rOw6mZuqH95mnVDn4JKhjHRWFLSbKIUGn2JCEaKjt7
         B5WK2sDznlYtpAUj696vhbUCeXphSfPt/WE+vQ79wfYbTET0PeEodOtH+GJIzwKzMKo/
         BIqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date;
        bh=3+8OSrLcmT5XsGgTMG/orQJ0QISqZiP0FRvDMm3UG4g=;
        b=nZWeh/FRNAlfYh9CPI8w6cpZc5z4e0utUxT7mLWZfcVoXA2qwdyBTotcpMz8RrB1j+
         sbB7dAiVZaw8LFcMMFsr+X82tIthjEzVT1SUpKEw6KOPXBMmFXTzfk30iUNs7242Mu5H
         FB05C3ypp1EpRRfhdtEmVbvdgsm9q5lS46HUwm6gQL7BElRP7YR/dRhhmojjMQ+q3JYC
         hidAkPQnymI0V3RHUbyUGIRttJVbgtMTxUtWZydjUP/eBcs7lbPROKK9u+yMzoLmpo0A
         D3RZLYSh5kUANo7CvP1rQhhNMSfa9mnwPCKbRKlBxDc6qDlVuqwvwUeGFRx2xAqB2OWE
         zVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:sender:from:to:cc:subject:date;
        bh=3+8OSrLcmT5XsGgTMG/orQJ0QISqZiP0FRvDMm3UG4g=;
        b=aiHpooLnpsLpautMP35IgH+b2hGjDICuHIBBdaeK19OJBAC0b3i1lrrE3s39ksoykQ
         g1iDnQiSx56w0lvWVTZ7wKVD6GMGUEt7+4IFTIEi2XCIeuZgM2TszAm0tmOcrjr708vf
         B3O+4TSyPr0EjshLzx/+TMqbi2tPF0hWOC+vmF62BulOBtTo8T9gyhd7C3XEko2wBc5w
         shyJk4bROaQz8TCqTgTXqjO9hPfZ1H9Wl31oYBi92+kCZs+kLg9lnVU64BzZrWpgMLge
         R1/PR0KM/RquEURJ3x803ov584Ycau6yYEquKPaF9mGehyZlTv43wFyktcwB2jeeEANS
         edwA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf1GXMaYRJhcrtRHQ9UraQG+Rh3+pmfm+hNdCvAtgBTga1bCzvoh
	KD2Ll5vciXOesUuLDngo/fc=
X-Google-Smtp-Source: AMsMyM4K111Xe44hytZ3RF/twpgJRe5hlqBrWYAYAiU2K31jYChy6lnCsDq7cUH9B3EfVWQPwN6oDQ==
X-Received: by 2002:a25:846:0:b0:6a8:c5de:3e37 with SMTP id 67-20020a250846000000b006a8c5de3e37mr3390807ybi.412.1663318033959;
        Fri, 16 Sep 2022 01:47:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:a066:0:b0:6b0:333f:475b with SMTP id x93-20020a25a066000000b006b0333f475bls2770065ybh.3.-pod-prod-gmail;
 Fri, 16 Sep 2022 01:47:13 -0700 (PDT)
X-Received: by 2002:a25:410d:0:b0:6b0:29bb:2bca with SMTP id o13-20020a25410d000000b006b029bb2bcamr3318580yba.269.1663318033075;
        Fri, 16 Sep 2022 01:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663318033; cv=none;
        d=google.com; s=arc-20160816;
        b=OP8nF1JMw1H5yQP1GNI3qJ8kFyxbCTYbQ3xcRDFs42kSgF8436EQSuEzb4bc7u/zM3
         nqrq3v0G7/uauj2AHERyH/eMn85koG86o4plUdXsNZCnFFvLcWmeAvCv8FUy9hSu0ufR
         chj1K80B2MKuORY6VXJvnoVe6RIzDOiZwdEuXBbjWH7x0E+fe0E6SRR27CKyfqPZnHe3
         2/4Vp+V4p/Tuza9GiafAOK77idJtH0S6e/EtzYo+ewebMgewhNbP2us7WrTyt+H6WAg1
         F7ZHyvGxVFrHRMt9gxS55M+SefhpDExdfuGM/TSzAKFtTNQzx9+t7ctEJ4e4s+mc7cos
         gPyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YNQhhnLP2IaYIDCSrmAb0DLC6VTKZOy/Bj93eUvHKMk=;
        b=sY+ZzoTTJTHpwJ+nDK5hvx17U1zf88SBVFNqbz03rAlnaTZolGlAr8xPd8744uoO9f
         3SRapgi2BR2KMYxqlmQZ5jVH/CywE1oKXCN7LksK36Xgq3m6yl3LpP3k8zw5cfeq/oFp
         TpfbflulghNW0/bcc0SgDzBHpnXNHID8vELlH1Au+Yw12Iwee0zCxebRWiNmhuSI7qN6
         /1Fpa+kT7GUw4SF/F5N3MvpDQ03XGyLxCGWLAPpIbptzPvuXwae6odyOXwIbca7RkK9z
         3lQHagusR5rG4voMWzY+jIN46Vt5paQCHK2jQ4+3BE8Z0+TRXFAuDJYRH3H0/mmLeNs9
         B79A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=FJi75foO;
       spf=pass (google.com: domain of andy.shevchenko@gmail.com designates 2607:f8b0:4864:20::82c as permitted sender) smtp.mailfrom=andy.shevchenko@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com. [2607:f8b0:4864:20::82c])
        by gmr-mx.google.com with ESMTPS id x206-20020a2531d7000000b006aea4e47938si292507ybx.1.2022.09.16.01.47.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Sep 2022 01:47:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of andy.shevchenko@gmail.com designates 2607:f8b0:4864:20::82c as permitted sender) client-ip=2607:f8b0:4864:20::82c;
Received: by mail-qt1-x82c.google.com with SMTP id b23so10519009qtr.13
        for <jailhouse-dev@googlegroups.com>; Fri, 16 Sep 2022 01:47:13 -0700 (PDT)
X-Received: by 2002:ac8:7f92:0:b0:344:8cd8:59a1 with SMTP id
 z18-20020ac87f92000000b003448cd859a1mr3479496qtj.384.1663318032278; Fri, 16
 Sep 2022 01:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220915022343.4001331-1-windhl@126.com> <f7316f94-433f-d191-0379-423c22bec129@csail.mit.edu>
 <89a1b1f.165e.18344069cab.Coremail.windhl@126.com> <CAHp75Vd-ZdHJfjdgob7=e3X_=NQR_chWZzTiSVU64S9eTiAY0g@mail.gmail.com>
 <7f9efc57.4645.183451f5b84.Coremail.windhl@126.com>
In-Reply-To: <7f9efc57.4645.183451f5b84.Coremail.windhl@126.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 16 Sep 2022 11:46:36 +0300
Message-ID: <CAHp75VfQHnt2YxuxbFo96tfDrHEZpEqSFKFV_D7ERe6uXEnvEQ@mail.gmail.com>
Subject: Re: Re: Re: [PATCH] jailhouse: Hold reference returned from
 of_find_xxx API
To: Liang He <windhl@126.com>
Cc: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>, jgross@suse.com, 
	virtualization@lists.linux-foundation.org, wangkelin2023@163.com, 
	jan.kiszka@siemens.com, Thomas Gleixner <tglx@linutronix.de>, jailhouse-dev@googlegroups.com, 
	mark.rutland@arm.com, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, robh+dt@kernel.org, 
	Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: andy.shevchenko@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=FJi75foO;       spf=pass
 (google.com: domain of andy.shevchenko@gmail.com designates
 2607:f8b0:4864:20::82c as permitted sender) smtp.mailfrom=andy.shevchenko@gmail.com;
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

On Fri, Sep 16, 2022 at 10:09 AM Liang He <windhl@126.com> wrote:
> At 2022-09-16 13:38:39, "Andy Shevchenko" <andy.shevchenko@gmail.com> wrote:
> >On Fri, Sep 16, 2022 at 5:02 AM Liang He <windhl@126.com> wrote:
> >> At 2022-09-16 07:29:06, "Srivatsa S. Bhat" <srivatsa@csail.mit.edu> wrote:
> >> >On 9/14/22 7:23 PM, Liang He wrote:

...

> >> >>  static inline bool jailhouse_paravirt(void)
> >> >>  {
> >> >> -    return of_find_compatible_node(NULL, NULL, "jailhouse,cell");
> >> >> +    struct device_node *np = of_find_compatible_node(NULL, NULL, "jailhouse,cell");
> >> >> +
> >> >> +    of_node_put(np);
> >> >> +
> >> >> +    return np;
> >> >>  }
> >> >
> >> >Thank you for the fix, but returning a pointer from a function with a
> >> >bool return type looks odd. Can we also fix that up please?
> >>
> >> Thanks for your review, how about following patch:
> >>
> >> -       return of_find_compatible_node(NULL, NULL, "jailhouse,cell");
> >> +       struct device_node *np = of_find_compatible_node(NULL, NULL, "jailhouse,cell");
> >> +
> >> +       of_node_put(np);
> >> +
> >> +       return (np==NULL);
>
> >This will be opposite to the above. Perhaps you wanted
>
> Sorry, I wanted to use 'np!=NULL'
>
> >  return  !!np;
> >
> >Also possible (but why?)
> >
> >  return np ? true : false;
>
> So, can I chose 'return np?true: false;' as the final patch?

Of course you can, it's up to the maintainer(s) what to accept.

-- 
With Best Regards,
Andy Shevchenko

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAHp75VfQHnt2YxuxbFo96tfDrHEZpEqSFKFV_D7ERe6uXEnvEQ%40mail.gmail.com.
