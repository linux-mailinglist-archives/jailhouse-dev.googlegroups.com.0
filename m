Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB3MARH4AKGQEO2F5MMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9A0214FB5
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 Jul 2020 23:04:46 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id g187sf43073832wme.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 Jul 2020 14:04:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593983086; cv=pass;
        d=google.com; s=arc-20160816;
        b=tXCMyUArh0PTaORMQKqQXOyFS9v2hOL5zr4GODpVwPasdMq1emErSwdSPj/R2tPQQ9
         b5uKKia9XnQclIahWyDbpZ/xBJQRrLhYnURM1ekE9ubqIbaHQG3YxrO83oLTquS8tHv6
         C2RfMeZgk1cVy0MoBtMUiWSCb5QRyDHa91HAxWYnpkp6vDCA34GlUmgKEhuDa21lLKYE
         Q1BWIddWPG3tgz9q0hgC+C1J/r66AymCCvKXntg0V+xVV318FtmWLak6I6pLWbe4ciVr
         17r51VY862QX6FacDz38IdGAt+45AWWH53TGjsM9Y3FGqZ2ha0K0M/whDorBJUyUdQ1E
         poBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=ERXzNie1j+ympTR9Kc/9pCDX/36yjAwWH9C5mhZv81w=;
        b=sWFWqzg3nXs5JOtQUoflRz25QACeqHD4qNPYSmnkrhD83M+ii4Ih/aQm2XkQsd47Jy
         tqNhUVlBfmpLsye62+HCIUUtlHVfawtDJHi+jedqQPJHwqH5KLnMo+C4MDmqYKcwSGo4
         PuDfprAPOkkkF1q7QPdVgxOPHOsMaYe4ttBvhExCz++nrANpZyebo3TTUO/DMgDr8Cze
         /BYynKwuTkgN0Ex0pYHGi9VYntoSCQj/+Hw3C8lM+3kXi4bti3OC7O9V0Sfz9+cS134b
         EjLdYkq9REjWAGwcVUk1FKTQT7XHwoNtmkzC3hUi1HA2MuzArlaUdpSyUdW4esiM04Uh
         5kzg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=XPmgx4Jk;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ERXzNie1j+ympTR9Kc/9pCDX/36yjAwWH9C5mhZv81w=;
        b=l/DuCn6pxbTnSHSw6x5+lFcrtwL2561FU7CMQVnJRKohjxqZ7/gFGFcxaOMb5DzQI3
         4yF3M4lwJqmEOt550vtpG/HMMue7xptsnT4Z9ihkyfqskN9Hy5i7LhhMT9tCiC+IAAA0
         oB0hlOfigRuyQjMnOfdosE7276PahvjatVZLpKNOUWFMr1p0ER4fTIuiFMFTN5tviL77
         61BhNy3hJqJOHvXVAEerVBsyVpJ2hSgnJ3oGIWAccxV6J9lHYL5ZsM69q4yF4Bau0X+c
         g7PqdBvTdREcxh1hOB1r2S6BsUapfrF4DVgefKey7Io1gPp/rmi7pboRy/TRJHTRXmJc
         u4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ERXzNie1j+ympTR9Kc/9pCDX/36yjAwWH9C5mhZv81w=;
        b=nq+5wYiyoWNpvTAiziRWG2Ei8JUmW8uOvKRG5nowFmw7/irPzjAiTSenqGWzF7krHt
         YgbUvMvuYUkP4eY3snu45CyC/vdw+R4tBzwZ7eqZLF58vTUCCfT48npXZoH0kY2Qy/D1
         JiUEHMR1gEvURLcAAwpo+IrDofR6WWCLZrX/MewWyx9DSUy1LCxd1HsPv8nHTkFUJ46n
         oPlnZwtCu/6x30jHpObQ4GRRiBsIoO1/wv53buGhVRx1JzJa3Ns8EKA8vV3ddA14nvfs
         KJSF3RDfD4B70DgYKQgnceyeAkfhUW949Q82AAgsjYDvW++HnTfX+q/QtGDtpE39S/L6
         Vi7g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5310cgkUQ6VJ3p0DjeemCBSx2SESTEFPs6ZbVf4c5VfMcDSe9KQV
	+Lew4rAaKiZvt5Q0cxF74xk=
X-Google-Smtp-Source: ABdhPJxqQyTMngolQWGg3/c2WjWXDA5MYQH1VqoioCNrDdq7S+hDwkKEgmvKopf+Q0w7VpIaUHkhwQ==
X-Received: by 2002:a05:6000:111:: with SMTP id o17mr48388233wrx.178.1593983085986;
        Sun, 05 Jul 2020 14:04:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a94e:: with SMTP id s75ls7217810wme.3.canary-gmail; Sun,
 05 Jul 2020 14:04:45 -0700 (PDT)
X-Received: by 2002:a1c:32c4:: with SMTP id y187mr47214791wmy.79.1593983085476;
        Sun, 05 Jul 2020 14:04:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593983085; cv=none;
        d=google.com; s=arc-20160816;
        b=buZShvXBaJF4ED1Eie9QRpzCadAwwzyYFF/MGk673A1oRhDDMoMzVt+x9+5bv+tFjh
         CQ15HufAwxTgiIMPrEH6I1xZzXD2jgfsV6Uf2ydZMuN3qp2WYpRyoC1zhHbQnAf4LhEd
         M5RgZRTym2ioLSmbRag4jayJ+Bn46IuEJBobOPZtTfEK+qx6s4ragF83HXEM13rYS7jp
         LcEhRhnj07CWKocpYN0q5r1yfGXvwQK0Vt7+wrhH7LtHlzeD+wfYkvyVZ5QMz5IgT35/
         bQj1ctKoB+KxnhHgKPrQfhLN7352HZPwzx9j3HhqH/0zZmZi2toLEJaLkSNmZW3SBfES
         FhQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=HC1D7FKdZ2zQVPWcyzHAsSz8AX1A1n/B4nXUe35FCfE=;
        b=0bgsYtgwIK+yVSZxRPbr4IltOGPTpoBgTvvdMsPUGy5ZTJG4rfxaNZuiOqFRzT1S/h
         SaK/r6t1KVj1Y6HthZoj5xKY9FgiDb+flN1UvVS0lwvyPyJ4s/47IsFkJGTA6+22FIi1
         1YclHuLGY6SiXK0xH9PVrJw8iUTsNrzPJXiBplvLHRRpRTjU2ecoJ7lrFamSepCuhs7U
         yLDiXSL1ExxTeTlDylRaL9UwCqhtlE1MKJlbLUa1vjgL/F1i5ZHFCYhoSPvoy6Wssos6
         KpMRmPJJSU0qsWAUjfbywhg2lzjweORXFNvRWn/2P928LArvGgEkE3pXQ3HvqGnSPc6q
         IgpQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=XPmgx4Jk;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id l4si989385wrw.2.2020.07.05.14.04.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 14:04:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.11.10] ([95.157.53.180]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LyUha-1kwrWM49va-015nBM; Sun, 05
 Jul 2020 23:04:45 +0200
Subject: Re: [PATCH 08/11] tools: config-check: add CPU overlap and boundary
 check
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <20200630064228.4742-1-andrej.utz@st.oth-regensburg.de>
 <20200630064228.4742-8-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <9a273d76-c29b-8c15-48ee-3bfd6ebc8386@web.de>
Date: Sun, 5 Jul 2020 23:04:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200630064228.4742-8-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:FFOfgK+Luoy+g4IxupqUD2TAD4pIXr+w/OVAanS7qqDGWk2tDMO
 2eq6hBza00w1c3sqUvNpzWEzYl/gKfqwfU+p5Sk9iETHVVpOFY/VMoFdV3quWabCgbfa8e1
 HQR3uGxqEIBVtT5Zno3ET5JhW9Q0AmUVblECjCIE8LOziB56pvqkyWvTY5rg7l5ZlHao9sE
 wVJ9FlOg+Lzed6zoDKn3Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CCBCCq/3FN4=:H8UCUuUlAQ1Gmp9Ah49OSs
 vYH1Zmc9VwknJU8A3R5f6AD7nqDvWofQOEvlEI12bdqH2+bpL1J+vFKkRasKc3TnDbuR7IWuX
 lrJZNQ/MiLrnv6CdUjs6Lq5Ew58ke86hzZDaw/wo1ao0Zvgj8Ou8iZYNNsbqxdDvSmExdwnKh
 LkqqqRFEDpapEgZawX/O1jGyTZnHcY51guhbObDAA4X4ex4TjDP9ZK0A2NeM1gWLgiSJDz7Oe
 t6DGq7F9hy/FHH3Gpj2DUHBPHOTX6a481ROkSPDbe81o2LOKHcOdjf7pY36728C32GHVGcGna
 Ndm1V7YSclSGYz28O9l+2+DlBhI6GKFBmVotMufT8FctygvoBGy3a02FrjXXjIfI90oAnXaW7
 BfNjGbzQPdD7aeEBrg/Zg5YuLY1XQGHdZAP7KtNC2D9/4RAWgzlsPfug3dckKfXTPNMzCNyXk
 8QWdnsEcLmZUQRvs5FGPteJrKQPRucx2UG4qPH/vP3iH4s3+AvkdYoyFD+z/STeoYcYGMrLvm
 vut3XOG2wla6V8Px/dnBbOEAdhR7h/qFT7/yuUowckMpF1SC1clzZAScjEKRCJeG9mE853UJP
 +tVXVcK9U2bXdvNjN8/6YD/+p54TuxZHGkyVmL7bWbLeCVVpo0du9yV24EY8Bp+rAdS9HpHa7
 /DuTmeXpzYsyFUqNGTjdc1O9tCbCathqTMOCy2fB0WXkVBb9PfdxLh/12C/i06pbi+7AMIni0
 cWUgv1GwFl/8aEFZchtDGYUMGeQosBTRi6nEsRw8zBYAgKFta1Zj3jefhomo8+6caGT4A03aa
 HTCw+6J5nStwVz4HdnSkdBtBdm9VQd3d8qooh6YQCOwLgldixsV8pOUBHrWqGjLxPMQ2A0NaB
 q5ybshySTrXEZdypoEFPkQ+vtZqjBZq6YTK5G6UCzVS4wcoZ1Cs6PoRj/gnIIKOmMRxMWKuAP
 y+fvgcZD9Q86U4FNRuaXcW+fUKpTTZ9sE7PCKvRY2cNKyEGyWAsz43HOQL7mPPtWiZc30WAmp
 stoIydCW/VClc9+fQK9IUkpkuAnQMyQ6cPqOt89L89H6Uu09iZGEK+3ebNt/Tjq+UGe95Awtb
 bmdElu92uVNSflsmTqyMVWxtSMY9JH5YF57YFF5nORaNKi+FjFZ+qGIxdRwDHR2qD7zNY3tNw
 GgonVnhz/1L+4aV3+1x0VvOZPG6/gyuFmzpdZsGSgRZmLKlv/SQtqUJxYVEmbCMfrtuY8=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=XPmgx4Jk;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 30.06.20 08:42, Andrej Utz wrote:
> Also includes some minor PEP8 formatting.
>

Please split style changes from functional ones, even more if they are
so many.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9a273d76-c29b-8c15-48ee-3bfd6ebc8386%40web.de.
