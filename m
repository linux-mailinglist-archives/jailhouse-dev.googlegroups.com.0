Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBF5ZQTYAKGQE5QH2LEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 9072C129AA8
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 20:59:20 +0100 (CET)
Received: by mail-lf1-x13a.google.com with SMTP id b26sf1590733lfq.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 11:59:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577131160; cv=pass;
        d=google.com; s=arc-20160816;
        b=Gp1rW7JECaIVRAqAcls6tAFT0g0mj5F6iMenDohKR0WyD+qrux1Mvk1Nf09fb+qwND
         LWq3O9uA+43RzbkKGrVF1v4KQW9tKrX0Is+WPbv9gUCuGrokkQU0V93qFN/vbbdjeIHz
         kfUCPoWYa18tDxJlz4APEZ4Z8V+/ngDmKIoa5DOd0rwK0UYv55aOXhmDFZQ+vhiJAAKL
         P0ortsCqkwEG4X76f5sAqWTfRG6Rvh0fitkGiJcecmGeu9M1GT5zwck1FDjZXUWqLoww
         0h3vW5ImWJ49DRHH6g+Yu5929ZVP+7Z9yjdfGZYCG1f7oMuQh4ob53ynO7YYvU/t40++
         zVsg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=pIzAyLBzJ+auwlHdtgN8utap8Ikt+GVkVbHckiZcN8w=;
        b=yDz7CT4uZbG/an5VP1WuA67cr9ZsQkNUddqIRXjezwqHE7z4kEWeJZBnFC/iNw/Sy0
         KwMO/EoikfDhju/bZ7t9R8xdsGxruC9AMsEJbtEYLcYnrixBii1RjfF1BCYl4itOZDuM
         tubnwemZuoGmWfurfymm+y0iPe85xlkma++2taVYfWPXum7q0yQUEGY9awHmD+uN3WIU
         +qBK3iMuT//xBmixyABGH3AiMQQ2pw9imyclp7jbJ/P++QfK9C9/Bz26Xxr0IOl/p0d8
         Y6XuvcoPbsevNpgqLTts7KX/QWaOOkQPeqdWVGi25ITuY2G9VhLCYUEa4XW2ra9yTdBB
         YBzg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=fMne7d+r;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pIzAyLBzJ+auwlHdtgN8utap8Ikt+GVkVbHckiZcN8w=;
        b=h/V90xy51S2p0HOi9cfcGe1p84SLSW8PWVa+Wkz78pk8Y9n+tgigC9qD3JK+8IngXi
         8MhG5bKoR7wiNsfls3y0xmGS9TjvTGerPEiTXZS19bq9eJENi0dtfOEUz0BmDr2nTB6p
         7lARNpdEkplQsndsd1Hbg+jAJQMwHUUoYFckGce93RQc64hcRCo63jWgAnNwmSNH9bNT
         E8imJuykC04fBL3wZN9Q7twN+AzfbYdeG5VPu12UH4TZyF/QJJRZPnwWVV4hgJkbha/x
         5b7CgevQX3HDXANTTdBNtddvBL9xOSFjME0+IJ7WxWDirbPixKPmiwFFcVvq5QjV2hl0
         Kc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=pIzAyLBzJ+auwlHdtgN8utap8Ikt+GVkVbHckiZcN8w=;
        b=IojSNZ2sxFlg16FEUBpHTRpxABP0dRVhuseW1nT8eWG/gkSsAQJohFxYr0LGkU/jcA
         Dj5tqZ34SnO66Ft36gQ7rmWSab2BfOb4ck16xHNMnThWkxqHaJsSQU3vwkl5QR4TXL+5
         bm6Rg+KYMwh+ANpHBSQspY3a4HBmHbkbvzxD1PmLqBNRuFGXrOvlxSCAZwjZg4aWisM2
         qQTjXMLAO1wRhF1F6i45nOLubz8a3FM1uAbCWbVwutRZYMPYs1XZAryZbK63oYSnwrnZ
         ra13OaMAo5dUMs+cbgG2auoug5vgxKfPR8sBSvUjb4eqHaQQze7AJ5nvZxsY8MQIjT+r
         uGag==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUjCBFAJdd0ttQJehxStKTWA8MRAIeyTiiAp6hA3ExkQpJt8e6C
	h4ONkExfVrAXdV4khHwtsBM=
X-Google-Smtp-Source: APXvYqyKZ7DkbwWU2yG+rZ64AxCX0iKI2Fdq/ZhTEsn6otLHeDMDB+uWxRJzdWYwrX9ZYfUIOBzHhg==
X-Received: by 2002:a19:dc14:: with SMTP id t20mr17785980lfg.47.1577131160155;
        Mon, 23 Dec 2019 11:59:20 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:554a:: with SMTP id l10ls1589246lfk.14.gmail; Mon, 23
 Dec 2019 11:59:19 -0800 (PST)
X-Received: by 2002:ac2:4945:: with SMTP id o5mr17473482lfi.93.1577131159460;
        Mon, 23 Dec 2019 11:59:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577131159; cv=none;
        d=google.com; s=arc-20160816;
        b=OT1+KaXM2bEk5rlhlhOIMJ0A5/zgSQHk4vadxkSbxtF9ZcfysuH8JTmeS7q5AzOPf6
         HmcUl0+gKwiqxdTIvZtyeLz4g35Tze9VA4gepDpvdfKV3QB8XMH7YA20Nul9tQFzU+zy
         pRNqRWgYZK1laMpd8JbxT7dakMHBbR7PP68xVTaxtj5dS4LiDTiZgvwbwOakNGYNMkDH
         ADrJN53EefPBkx+tLxb9yJDyiOt67TkT4v9ByCm4qbD9XIpW3V1Cje3JC56h/07TRq6P
         u4C7A4MIqNXpK59ZZeCtCCKv5YZKLMDk62KyGG1BtgjNj0wnZ1WkX+v6HSz6iI/mvyBo
         HT+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=2QfOMPoNdulcOSZJsdX76egiEyd2VGaaLsTKXx/aI54=;
        b=p+r21NUa+OkGGOK48VoS7cj+niT8SVZposPIXtGkEJcnGft/9t5dtXEbRXX0lnWUuA
         htdD3M/1Le4OgZ6XdRjp2xRZG1P3LxmnSCeWVD2v2PbUblKS7UXzcjmoL1meZRlc+BMI
         TN6922db/jTJldJuJwzC6qAxTiIaa6qcmmxW3FJwDTfb3H3ms3P75jhKw3HquDX84NAa
         08ArKRgwqjWiy6RZeDg3oR2eBk6MJmO6MNyi8zYrAUwSdm0GSV7BcJDxuiSO63+1+QhG
         xN+CTo1ntMgtDWWJCa4lNlb4iqloY90T//W9suXokG+xT1t510eiT0sZQNFOGYGWly+T
         PhDg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=fMne7d+r;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id v16si892884lfd.2.2019.12.23.11.59.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2019 11:59:19 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.2.196] ([84.61.93.39]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LocJe-1jPwPk2hSs-00gbwa; Mon, 23
 Dec 2019 20:59:18 +0100
Subject: Re: [PATCH 2/2] tools: gcov: Adjust Gcov counter count for GCC
 versions >= 7.0
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <20191220154126.1136-1-andrej.utz@st.oth-regensburg.de>
 <20191220154126.1136-2-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <2a2f1c65-696b-d0ce-1c46-f133ead60db0@web.de>
Date: Mon, 23 Dec 2019 20:59:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191220154126.1136-2-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:0+7UoOXZ+DChGinSnghZeUwK7aPbkMhpsOboKhd9uZuc0xAIUpW
 ImHzMSi4bavzzsMXC6uf+lvIOiyR8ENKVkt12rZdFhpqqgSMGYbx95mXN4pCw2xJTCoSgia
 f5tjLJxXzJZi8p/oefqbm41r27aYQpt9ivippyaZ5suiRJ2wXRr5cZCZeePfMnUN8XII48/
 86diKn+mrMS+/IzrgqGGw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:316EgPugiXo=:9ztAYif/3O4HLWztXHhjId
 LRTXP7uWN9EB1TV3CSs/OH9rBddduJTj2xBHsDcRqn/kfK5Uh61m72tujjuboHWaDrwiDp3PG
 bxvdNtON+Oe+GJ6CKPllJzJ057NKey9m49OIltRyATx5dzwH51v/vWsFaD3zeu4os1Qbz4CQ+
 Quu1ZF5qnRMAaqOQNtcqIvKFzv89mtiP+rmVSifCQlM8uEJybFIw2FdFgzmhUBkRWT5oMTNdw
 Mj6Cl0GZ/GK/xcJ+i6kkEucosjpjForVR1LTZLHT570X7MBbboh4MUxfrWtCS82dc0U+y7kUl
 v4beaHaRGXXLNA62Z6smGf0gRYPKRiIqLSXIRUDKv83rCZxsASn5Po/Iea28zdRSeRHUI8MPX
 glIR5OrzOI7DhpJJDKhJJTyHNucjubC53AfcmjjV1DIKOgt5fgZxzgLCPNnT1bAnh9wFAqpGT
 cuNZZ+LXZaeq+9sjrNwEbhzVlsao+jew5m5HkQodt8lCGTjvXJZrPbJI6m4VyRGp0tr8NImkv
 mkbUwvKRdTa/8iugGmWsnQXmOCEsw1eYV+Lon0iEQaCR8q73V15ILJZa1fUCmxIxt+FQezHC4
 J0WeVQo+XKph35k9KSyWK9ZJH/1vq88zhap9SzEfqaULtO7leKa1nHH+8Sx3gU7nsT9NLYpLT
 o41dGv4dpkheKwUWb9tCKES27CXWhV7OswpC5ykQWHar7ABMH2z2KMgFCmhZZy+Aea7oio1TZ
 BTe6gy6fxtGRaUSnTMf9fFxZy5RD9UnOa+do2Yul72Er9HHPipU5lKyhdkwFkuLyEAsUvyR9c
 QQR2Y7kHR8sWx0FpHWwtlNvRgTZe6LNGtW//34k4WMfTwWcCaiLJvOqgKERCi5jwpKQqST1qG
 kYOYL4nLOI24R/vBEerJ7cATjbkxPCq7IkmOo9p0etmk/8gj6DREbmBuem/fVnKae0Rf8mfzh
 QXhLZf9fHvGKHQEA/4C3hS+tDRd0e4/pL+O/HvULkYbWBplGTgetTBhAOa7zYU02F/5xUVcgi
 6uXWmubNAfWFaHmFfAg5NAu0fCbagOXYn/Fk8cRmMRvZtwxUwoCG8fjjW9dMBJB70kvzo/aj2
 QUDA80XK1g3lXNv4HRCYOIckdNvkfZEvR3zlv4KG8zvxqYVqPezExW9wpYEazyfu9zIwPhsda
 Ea0q8Hla4kgxaH6mwk7D4sHR4iYOr045z5aFSJp0pNTHpn37saxg/DVmIeSXfS+fa9WBw2oCw
 7+CmznPSm9wf31MRTonfzD8x4jz8UW8VDx8lvh5mSFAQY+jLbgMw/m+7+p8Y=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=fMne7d+r;       spf=pass
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

On 20.12.19 16:41, Andrej Utz wrote:
> As in linux/kernel/gcov/gcov.h.
>
> Otherwise the extract tool will access Gcov data using garbage as an
> index and segfault.
>
> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
> ---
>   tools/jailhouse-gcov-extract.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tools/jailhouse-gcov-extract.c b/tools/jailhouse-gcov-extract.c
> index c126f976..5bb337a5 100644
> --- a/tools/jailhouse-gcov-extract.c
> +++ b/tools/jailhouse-gcov-extract.c
> @@ -43,7 +43,9 @@ typedef long gcov_type;
>   typedef long long gcov_type;
>   #endif
>
> -#if (__GNUC__ > 5) || (__GNUC__ == 5 && __GNUC_MINOR__ >= 1)
> +#if (__GNUC__ >= 7)
> +#define GCOV_COUNTERS			9
> +#elif (__GNUC__ > 5) || (__GNUC__ == 5 && __GNUC_MINOR__ >= 1)
>   #define GCOV_COUNTERS			10
>   #elif __GNUC__ == 4 && __GNUC_MINOR__ >= 9
>   #define GCOV_COUNTERS			9
>

Thanks, applied both, making the kernel reference in this commit log
more precise.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2a2f1c65-696b-d0ce-1c46-f133ead60db0%40web.de.
