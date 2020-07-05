Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB54CRH4AKGQEDQWKGRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DD3214FBA
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 Jul 2020 23:09:12 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id s22sf20389584ljs.21
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 Jul 2020 14:09:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593983352; cv=pass;
        d=google.com; s=arc-20160816;
        b=W9fhHqhv3BGMDyn0wOIOaUKLEb90CHiG+0AFC0+vnxiIypS/6ZXfTomy4eeVaoYhfC
         Oyab2jCKeHPg5p9YQP6E+Nhxa3/RHg0G13GSqZyLjGE8WVH9lG0MioU0Pifg/VTonXWI
         01ja4dL/zCU9JjfBGrk8B7IiscXI0pIEDUZJbVMQc/MnJNaICypIq97qFK83poy5h+MW
         n3J1Q2q5Vg9C8o3SjE9oFR0nBeeNSYVZMB+7nbHm2YbmC0AT7HBdzHgv3ZDg09au7uJh
         VD1jRgz55X/E53xd4uMrwrwi47BC2uxc/Jytn8jUM+h6XHQ3r1Tb/kePZB/X9h9+lcJ6
         hXeg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=iE6c/fufjWBIgvtwpOikDDg6M+n6Ax9wrR/NsmoUbFQ=;
        b=tQBsgb4NpKQl8Pn4ChYoMFCEJj9nWjfJ+Xc1tE0Y5Hh3UT8IJsnxSvgTljjHwp3BjO
         UNIGRmhePJaqFaZfnL3Qzvd+yaCJt0U3ZlkTXGd40rLr/z8sYAKOfhD3mzxX7SSowlrA
         CkgzvNYGNvOYACyM3npz7O5ouQ/W+S95l0or0PRabbRlzNdimvO75M4XPtQnD9CH5weM
         aXuUF2gi8Rprjff8k2iejS9xCD9wtGhaqZRSUj5YUNW7CynrEyPLHJl5SmTfvRl0VlDm
         t+xHwHUcthOugSu4mxCTH6sv4M2BxkbbD/dKpfM/tQoa3LTHCEjFfZZSQM4g7gyuDO+P
         OwCw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="qEWeVLV/";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=iE6c/fufjWBIgvtwpOikDDg6M+n6Ax9wrR/NsmoUbFQ=;
        b=TfGDejm3V5wFzYr4WEQbBhW7dkniAENkB9k2nmTz4MJtDTVce+gPqoIIJxmSRpHF7w
         y0CQA/sydTrxI4R9EdZovg9V5sBEK49MVIz2lJdyGZJ5gPPp6QFjuOAtCKlJiv5c9YTn
         Ki2DTRLwReYEvq/S8xkOFe/SMChHW/9TZmOuujgsnb+6IJkfhcj0fqDBtUNyWzuhnkzs
         savjSNpzVIyBEvycGJtJghDPIrSE+YmlAoJ/8dhsjap3izIyRc8hi9on61iQoynrgyeW
         nXUhxUKf+qFobC2VBs2Sf/a6lHlEmViJQhnI3lVDIL3Yec68IViaa4RZLpGPhZGiAq/f
         1vrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=iE6c/fufjWBIgvtwpOikDDg6M+n6Ax9wrR/NsmoUbFQ=;
        b=jF7N0UAUqpo3mkJM0wlpQhzzMEvJ8/aE8MEhUwuPsAcKu30WaEp1w2i8xQCZ8HL59W
         YxqQcyaFUCLULjRDK3M2k9xqdtvECmIWqOE43Scod4PGGl+R+acEn22RyfFIaaZCyviJ
         J+wiUd5enb8ZZmtLlRHQUjB5DP+qERLrLPRrCQ0j/UnIoHgBciYf/EWCDAQNKOo/E87Q
         nrf/KiHA7kbHRz9ueT2SzurGWRUpdYfJpXibGj7UPwCaXQ18UY0E9n/Oh1N+HyEags7E
         Updh/sn6zN4gv8Xynhea3wDaKdAfsTCKWnrPHO4enanIELW6SGWPTiDVOxFdPvEqgBtv
         7BEQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5334vArr63w8WS7RD+Raz6mzbSd3nkhQ7q0qZdNguzNuGsfDlI7m
	Sf2D6Ai8jFtyPu2tzxpj9Kw=
X-Google-Smtp-Source: ABdhPJxnS54uJQW3X2THO1zaIyf6aw7tursQeH7Pq3HorykSNygZhOV19zQV4z5qhef+sIy4PpP4cw==
X-Received: by 2002:ac2:4c2a:: with SMTP id u10mr27685128lfq.168.1593983351945;
        Sun, 05 Jul 2020 14:09:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b0c6:: with SMTP id g6ls800794ljl.9.gmail; Sun, 05 Jul
 2020 14:09:11 -0700 (PDT)
X-Received: by 2002:a2e:9b87:: with SMTP id z7mr22426086lji.80.1593983351313;
        Sun, 05 Jul 2020 14:09:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593983351; cv=none;
        d=google.com; s=arc-20160816;
        b=cl6AN153/tR9D6VoUKHUQ2bJ/oF7HcUPK6uCI3f1iDlCYc6rt77WlcN1Zh6GgtIy3/
         KcJmrgvRnGkxWIu8cqlZ235R+D13E5nFVCimv4YBPH3LLoNK78A6cJZaOXbL9MHmYq1W
         TLg7PLS9UeB5h6TTdgXgYBpc5FOK5LVC1TmKUUil8rpEe0yobcdu0chCzjG9+B7jnhHM
         J0+qIMLF6EU+1FKrI5VFtRqxeGa/Bir3dU+8uiR4y2AWn1ud9aKVetmuk9TBOC0DMHKb
         xZwPeyBwNz48aIYxHFSP+aL8XuzYSalJzpwBsOq93xhcN2XQWvGr6AewQTSwcskhcx3q
         D4/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=dZlojk/nYUxe8V1CjDqUz4nZ2T/8LcdbZGC3+uN2a7I=;
        b=xU1+jnCZI9cEAbHFYCveJbzQcKgMCh3NmrjCG2VznKY7Q8aLhIQqC5EyDJMlkH2T6V
         ufNGNVEul+yKiSNiOG2CqyjBKCmywuuFlIq1uQ/O5Ck2EMpcQEd2m2v1BZ5+sg4Mk780
         kfKVmXAssk7gh/UkEEJI05GhxEsZzoN+WyOkIXFGpgULH2uWamoGu4EO+Vfx8/ST0Ayw
         nd/VTR1BZZsjytaWcQB7KM6Fe/Sd0I1lWt5MbOQ9DkdH8q4/efSAmPx959AEueEGA6yd
         23jjwyQm4f6MDsHiPlxG4Ay19zbzKs7n6G4v+qedJQBWNmMWkzMLgKz7/EO2T1QgUEND
         fg8Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="qEWeVLV/";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id k10si1016844lji.2.2020.07.05.14.09.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 14:09:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.11.10] ([95.157.53.180]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LeLin-1kiMbT25uf-00qAZd; Sun, 05
 Jul 2020 23:09:10 +0200
Subject: Re: [PATCH 10/11] pyjailhouse: config_parser: add ability to
 serialize C structs
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <20200630064730.7210-1-andrej.utz@st.oth-regensburg.de>
 <20200630064730.7210-2-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <8927c0ab-9742-64df-b399-929fb2163e4a@web.de>
Date: Sun, 5 Jul 2020 23:09:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200630064730.7210-2-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:JpSzZbHFwyjbEF25df2U6MYfZihZqYemi/u3SqL7FRE4FtApNmd
 Vpy4BIGGcuGaxBMx3gAn6pjSPw/BU8zkVu1UsvBFuPbIi2+qRPdt+06bpYbML9CjDIabqNW
 AvC0nK+o3LY+LNddXxZlNsAMfp90Vrp59ExVOgrev5hDfv1vdo0yacQ+yPSCy+NANIyd8+f
 lS94Rr7wZZXtXha5nyxOg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CTP0FcTkEuw=:g5oBqIo/1D1m1eVzc2e57H
 SqeUyYHdODC2dUo9mnBhlirDz9GJB1db0HxdEs1yOMdoY9p4+zE4qXoygCi96rsBxoRJEcv15
 /0W71IZgOjAIoWUawrjd8nyrOTUQXpO8Zage7cznqrdq8hiCgZb+pkJCGGreDugN82uUCM6wa
 v0+1IVXtPvMKDwg7sQB7fSS07yWAvOVg2R8gpgj+enydo0z77mtjLDdeszROWjiDWJ+4tgAUt
 483M6TWmCrS1KBOPQCaPv+I/4nJ3x7lpFbT/ZCm1eLrX+qO8G3R5DfAfn5nl1szZPBOurucl2
 qK/dkWyN/fzNYHaZfF+4H2ooECK80dx+NSyPSl8eP08Th6IEbnz3FSW/nTSq9VXeeB5Q2D8xR
 wn9ld3WhmLAgBcfj1ywzFxjpTAKzL1Uzm8gN0Pf3Zl8h5u23axAUyUFk+pkjyFGy+jXh8N6sB
 zabTm5qHbHBcwjfYZ/vsu2sYSE/DJaWpinI+qJLA1DN30W8xx56gbwOepFEmgx9D6sHrS75GA
 KEgYX4c2JyqHJgpzH1MxNpJPY6ivuyYcHtZVxr4U98ugdipjkAD01r6sd/YFA9sIP111zFf04
 p2DGku8dwlrTPU/mPbTebESZlZ0nfWP6suctt0uBsm4QQbCndonqERG93TKY3M4NhJ2T9pKrN
 sPZArL6MQ+lPMI3dwv0g8rn5sINSXgDplZYzO9k+5JOcsOM3tSzWM1CnSNuImBnyF5gEHg4cw
 T9Gdhu9gE+yBcr01ESthNXZKvvgDvDr7u2l1i+Lj/pnm54sVRtIZWOBjFoUjVLxeTD4WTXaEC
 tdhgVsKOw0C2ycpWAYUihD/b4PS5V5VjADb2nC2z9xKGyBc7OS+gtKbmr5IJ1epsNEviLGozD
 95FPN8HoBsurmT5sMuR97GjTwlEr7tQZRmk2j/oGYgbsYf7RW/DTT5S98wCyRmRrwn456y04j
 EMUgCzXwjyQsqARsozyCtIV9/iR2AS/vsc+SZI3fp4DCPimeKlC7D0BCY5oevjSJ9HXameM26
 llw9Jxq6z2YLMsWgHMKdXSPMWqc+JBhMRAK6bSKFRAvfYyp/J+kspdkmZ1uWE+XwqS5kkuB3U
 44wkbgylMAsMgB1TYGf3Ao8nmRSjQHLdihVReW/N82+jJ05bReTrcY+YyXtvFXsG0VAjOvvy7
 zSWWJ/mqO6bEkB+MsbFDVJhAVtNtyJH5aIBhy4vVqHdk1p2FaVvxRQrj3A4Y38N3HqdOk=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="qEWeVLV/";       spf=pass
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

On 30.06.20 08:47, Andrej Utz wrote:
> This enables to create Jailhouse configurations without relying on a C
> compiler.

Same points as for patch 9: How is this used? How is it tested?

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8927c0ab-9742-64df-b399-929fb2163e4a%40web.de.
