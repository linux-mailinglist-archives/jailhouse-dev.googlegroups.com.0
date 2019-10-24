Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBS7PYXWQKGQEJVFNBNI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B2CE2E1E
	for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Oct 2019 12:07:07 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id l5sf15174912edr.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Oct 2019 03:07:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571911627; cv=pass;
        d=google.com; s=arc-20160816;
        b=0Y7WOeY0bm1uDmrOc8lz9QRlA+CK+qOAUXv34YfKzGuJclLEWN6Q8nAnLGY6KL9rq9
         I66Tx+3gry3dh9yoPuEKtSKnivKQJHzCKd8KH1ZzFAdqMFE3CPzlXj1tTWVNCi01FfY2
         YzXBoOfv3wiJDjRHdxBQir4x5vTCej6b+B9divXwNpc8uvqheNcR84GyVWJ6qNtcOnwq
         WEizrVAqcjNRp/La8awLrjI38nDaZkQMQwsm1y0zxqsvNQyDuo7kNpsVCxoMeqDblyfn
         RyLfAheeWBPD4P0nth5s/j1ap5jWXo0exiRryb0Ci9wQuVXrK23GyvuiEoX3RYTObIww
         mtKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=qzmMayuV3+pJjvh6NNJNh0kr2qwYqV++a+N4PsOGJQg=;
        b=sTW45dVmDLwgG0BYdkzyHpVZx7+G5uaL881XecaglfsnSyxlScxL0SzKm05M2tpK5P
         1tJe6nwxl8hKiNurioG1UA0NnxBcIk/HwTqTSycXUVoT6+CdGQTHWc0VnxLyYjbKDR+R
         t8ZMNq8tBoo2uDBNpxm1tGiQ9LBBZa5i4L3yQvoav3oI+WUmEdiBI+8JrYmGHD3p6eIl
         vBPgGynVKQclGVqzjtu4uqsBZfqks6mrQ0hS51O/Qn9EqP4LxVQmcY/9KQVj+UjQe7Q/
         C2UaeqwsBhXhUJ5fJK/oEuXtY6SwmwkQwDQ+lATgO4JmqwqP8yfPiEs48D2xIi5UJw2B
         sQWQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=YBPlsd9N;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qzmMayuV3+pJjvh6NNJNh0kr2qwYqV++a+N4PsOGJQg=;
        b=Q6DGmOhhyVzmXI4Jv7djZhzxZKi+st3AxMdohbOEs7QXzMD6N4WPOe4lZ0iiVGEJ9q
         27lcwuPbneaH9es91GTVvNswLUs43nvzrmWal3yzZuift6jvo2ez/Q1hDPXC4LpSM0rL
         oMcfUC2A/KjJ/CcBpxLjP1pu2Ooj06S/ZnToaYEmQ7yj99mrrwMV5y6i+gFxfv+6cJoa
         uMG8QdBUT8xyU/ipM7/In5hu9j4groJ+KKET/mtJMrOAU7AmlDe18lFX6ZHsMwW3DP6T
         iirjQgS5ChPgCaglwXwIoCEG5+tNytR6Wf1uI/UmMT7dmss/Yn6ci+M4uiMtrcqRszQ6
         +P3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qzmMayuV3+pJjvh6NNJNh0kr2qwYqV++a+N4PsOGJQg=;
        b=UMBSM2DLRaCXsdmkRjf/djvmF/0JUvLuDgUVAb7nYY0ALmfejZpAN6KRQU4KFtDHYU
         EIpe+/KfdfEQBRD4GxUH9YC5j/ce7fs5qJG/BjRRuh+lx+DtDn/Lb1X2zA05fm4vHSuO
         v4oeTn1paUQe+xe0nrIOOF3vbYIf0byn0QWGMj7j1zhKR5/RlV18cSaz+yD80neHaOAu
         Ge1D5098Kn8AIDiw2AusGsL5S0voYK/B/t3BWgh84oZWLybau8UNfRUx7uLJcF7T62EA
         xyckx2dKcMM8aDbrPddxTPhfrpAKoQEKi/5HThv7geXeWLjCrpDhKYMOmYgu2dg0FJlL
         yJSQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVRFxsf05qQPdVzop+k0wfXsUt50IHf/SB8pYz/XxyYDPB4mNHp
	IVpkxgKwegBajkFL9SBNGdM=
X-Google-Smtp-Source: APXvYqzLHmGAHUTg7N0w23aP5T/PTp0VZxEFSV9UFpasZ+z6KDphCe0CYhMGbCegDBft0YhRtuRZnA==
X-Received: by 2002:aa7:d145:: with SMTP id r5mr41637013edo.275.1571911627488;
        Thu, 24 Oct 2019 03:07:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:e2c1:: with SMTP id gr1ls1172884ejb.16.gmail; Thu,
 24 Oct 2019 03:07:07 -0700 (PDT)
X-Received: by 2002:a17:906:1da1:: with SMTP id u1mr21413831ejh.275.1571911626952;
        Thu, 24 Oct 2019 03:07:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571911626; cv=none;
        d=google.com; s=arc-20160816;
        b=0mJfHe99WCczraWTsVH6pE+bvoRbuJoJRAK08JoM2cLQWw5w71SuQ70qtnTeJEOXr9
         /h4LkH/7W/ES5FBfwRa1HskCRa0ElFhUiB6lsu+VUm3QA838V8EWPKCSGBqQXqhlDo0/
         9G7PZk7hAv0E9cUJShBjADSaWSr+LxB3ZMB6irG/TljkFGq++ueQtT7taxVw/hS4kXHH
         xrvv6QRrsZ1rNxc/SRrmiLWj+q80KwqaSBdIvOTErDh3XbcUwD+v6Iv6fFqqj7v/xa97
         37tmkAiht6BXTA/N71rS3H5osnjb5lBZLZ7myUzARVXEW5Yg09fIuL7At8zPBQxa80Yk
         5E1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=3HWYIOhopVP8oMF+QzADHl1el0MZKEIyBzViMQwzn28=;
        b=XiA3vAPqihK7MKsCg80bmSx8V9RWKMvNnXnM7ZsKTGaWV8162cc0Dvx1IY+SLwnyCp
         2IWyQQsmxNdmM+u5TyWKwF0KD+lybBI2UijGU9Ro/GucPZXl+9GFyp3eHmVGH6bgl0uO
         FAeOElv+1AjyY/4rLfFRrlS15jim8TRyGpCARpgmihY4NWmc7fH19KnKJvATwr9aUp5s
         PJjldaDF/QtlPsWgpAaSzfP5DAr5/rpQXMyl4VP3tJX4sFOdstypDO2Kqa+6/Ou65fqM
         Ql6xeqFkkjOWrZVDAexDkiS71vuGGDJa2H6VFSE6HZ5iVT2Tm4zpEWaBsjlrQOJpq+LY
         oiFw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=YBPlsd9N;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id c31si58356edb.0.2019.10.24.03.07.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Oct 2019 03:07:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.143] ([188.20.186.1]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M9oaG-1iGxFp4C4W-00B67X; Thu, 24
 Oct 2019 12:07:06 +0200
Subject: Re: v0.9 vs v1.1 interrupt latency raise
To: Chung-Fan Yang <sonic.tw.tp@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <a54a651c-13de-4aa1-9c32-475ebddc4e6f@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <6defc2d1-96ac-c470-818d-1c9a8e1d8725@web.de>
Date: Thu, 24 Oct 2019 12:07:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <a54a651c-13de-4aa1-9c32-475ebddc4e6f@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nu+RP7HFL07laJiJtrC/an9pFIcNOyXooIZe1fuC8otuip0sQs6
 sxh6hQ/xKZbXqNBgEfsQkHw7mBfjngakWMUVYNPEDjZyVNrDUo+fp/H2fRAzmsJAHR0Bte7
 A1sKzbvui+Hj1Ik7uVXIS99O/IwuXcQnOp9A4EICBUu2DpQtLLrubdE8D3Qv5caq4rEZAWD
 kTqGd0n25mTgeVQ5xAsFQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4lkJ/Q2eAxY=:pf4UIbRtwefLzTC8XuFbcL
 Mrih19UUs8BIwf95wpNb+/79xhxAjzR4HFVNZUC2o5RM03czFfNiokIYJorDz20t5/kyp4BO4
 ur1i0p7W425EJ5TUELpTPxtdffvIbzjXi0XHSO62vfvwi1F+nhFqXVMXsx0GHIXUqPV+HBdQ9
 opAgkjOTMQ9Sz/wacNp4G7cbBJBBhGjgjhBHohA47xp6q1KWiVbvST2Mr2k+iL3G2QQzuPV7Z
 S5XnfHWcLUXXFA/vpL22FOaFPf1epvVQFzNwdD4s61539mCCv8OE03Ja0i1ZKjm315r/DpmbV
 4g9VqoQ4rF9VMu2dFcDf8n+TvRuC8+An0hsSQSKtekBgkzVWxg+HPi0s2fa32S9QLhuTIu1MN
 Zm5CkWvtGHVrXziWaHtSyJxacq9w8rgM4wuKuYA0Mk/dOR6zy33l29C7X/KvyiqWpJjoSP7/e
 tgdgB3didQCtQRQwWFI2JpI2RB6NN8IyhgTU4/gSOixU9ToP6rv36gQ+r6VZoqllek+zQ7mqz
 mi+pSJVL1hBm+IPTN0shBAtKYvGtmBpQ7zU/+GCxitTS6zBaYVAulDoyk16p2uc1DufFB0zAJ
 icuuF8TeH5V7GoWCh3WHiF8jSBCICRAbYTsCoZTW5qKD3wydnFA2a6ez9or6aZWfQCnBoI+Fw
 kZNO0d6IiIHlYvVT4bC3Aqh2bh41RZ9RQihsZ/ZfD/ThWTR6ppZ7/vwrnPbYT/1C4dnF7fMRV
 IVbNxJHyrxWLFgy7eTcJ2Vnb2Eom8fM9kw8xg0OmyM4zbU1Bhal6pPxED7eI/FanAbohr8rhr
 FyBTHZCLha758UZ39chpEOHJVUYpwpjaV5nBbH6c9a6vUtX8UGdxGpa2/tna6X+fQTnXhTL5h
 n6Qp99Dc/fyislURqRDdNIqnXniqKmp9y9X3dzhgnJKttbiyYH3ztTUeIoGMjx6EnR7nxqxak
 ZPgKkbvo9mS5//RU08xJeysbVQ1HOMQbfS77Q9NMYXnt3Z8CHZRKulnTIHNLAtr+BHoWx7Xuc
 Q6Mktaw7LD+NXw/0XM09jgY77l/CnLy5nyYjlrafBkokzQ+PUll2q15P40FY6rdayaQmt3XX7
 5hW7yOqTmRjkBoRzrD5IiWSip0MA1JFksdcJuDUi5SQLb9OVx0gCx+RBEQz3GJ5SlxwyhQI3y
 TdjiZ3sHn4y2Ikfb4FBclry60oppbsj+koAQTpHAcgDXQGp2SjHrKlpuY1kErEav0zdu2H10O
 SURFOVGUGbqmUpCLz94ONrSloRuAHi/kq7u68tLFUrx+/l9ae2i5qEvFZUwo=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=YBPlsd9N;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
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

On 24.10.19 10:17, Chung-Fan Yang wrote:
> Hello,
>
> I observed that the interrupt latency raise from 20us to 50us (measures
> in an RTOS) after I upgraded from v0.9 to v1.1.

Do you mean upgrading Jailhouse (and only that) from 0.9 to 0.11?

>
> I am working on x86_64, so I am suspecting CPU bug mitigations.
> I would like to ask that are there any CPU bugs mitigations in effect?
>
> However, I do find out that in Root Linux, the latency is almost the
> same, comparing the 2 versions.
>
> Are there any thing I should adjust my RTOS to adapt with?
>
> Does anyone has ideas of the source of such difference?
> Comments are welcome.

We refactored quite a bit between the two releases. Namely, 0.10 brought
per-cpu page tables.

You could first of try to narrow the reason down a bit: Do the exit
statistics look different for both versions? With Intel x86, you should
normally have no exit for an external or timer interrupt injection. From
that perspective, even 20 =C2=B5s is too high. Try to identify the path tha=
t
causes the latency.

You could also try to bisect Jailhouse between the two versions, in
order to identify the causing commit. But that is only plan B I would say.

Jan

>
> Yang
>
> --
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/a54a651c-13de-4aa1-9c32-4=
75ebddc4e6f%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/a54a651c-13de-4aa1-9c32-=
475ebddc4e6f%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/6defc2d1-96ac-c470-818d-1c9a8e1d8725%40web.de.
