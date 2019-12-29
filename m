Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB5FSUPYAKGQEVP5UX7Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D5D12C387
	for <lists+jailhouse-dev@lfdr.de>; Sun, 29 Dec 2019 17:51:00 +0100 (CET)
Received: by mail-ed1-x539.google.com with SMTP id w9sf9431590eds.4
        for <lists+jailhouse-dev@lfdr.de>; Sun, 29 Dec 2019 08:51:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577638260; cv=pass;
        d=google.com; s=arc-20160816;
        b=AhiUhQWqU27KEyE52MG8TeEG9hksbELAPtCvwMNbnIZ5MCe9RyutL28ww6IlOAMVJQ
         EctHnxPV1Z2/6tx4DT6i6PFy7RIY7fDn4em5YKlPI7dwO1MsG6B43TriK9zHSbobbLa5
         fA3GKFqfZtMCq3gkFVWU3vjMyMe257TVaKdWDK48+5pmW/hgd+2RM0FjUFOWVNHX0rRs
         HwF/xzUb/FS8+D8ybTus7+WtOfdoO8C5fYNgX86Hbes5hyGUnF2LbbJyEbJbWfWBO1XS
         Oc1RDwohAxuNZOl6pvvbOPlCnCka7xqG7c3llzvAdWYEnqogOjYfsWXXFvhJOCnHLQoi
         xZfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=6y2X/vzwMwkxnQsLnLmCsH4darNYv3HaJ4Cu9dpQPXM=;
        b=kB9edTomfJlAOaWPgoEseKX1PhOD2HD4F+ik/WzeyUsnm1+OwuRAysc5I2l6bqH8xS
         v3izOAyNoTNeZS6yysGfwCaoYZe79nI0nNKiM8x3fiwM+PtfqvEC1gKJtoc5hDTVV4Mq
         daqiI2zmiCeiqBSUtcP8iI/HTVuKADwK3qNGiH7Sr2S9B2+dz5qJWmw+jGiwZnknG57+
         ZQjBlQ/nJJnWUosQFdtSqyhgD7QErDhRuG0xgVdkrheaRO98q/InGKNnVoSWgHMT07xn
         lhb9lCDE7UV7LlRs89D9eOHs2BrmgA0SloVNf2NK0HMD2NAQM07cYRil5kU0OGBq7MMd
         8J4w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=UMHtL2fD;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6y2X/vzwMwkxnQsLnLmCsH4darNYv3HaJ4Cu9dpQPXM=;
        b=Lr627E98H9WRMr/ulxmOBTpp+f7zGvwxfiqRV4GuQMRJq6bE1ij1vyDDbpbTHAj4WM
         6dIdKhCKZ1vx74augyH9buWSoyO6Q3ZMBI0IuuSaLEQSOVkH07HJMp2qEZtq2+7kRMuS
         Sy0EKI2jueR1GCWBWfR6e7SazlDWBNDb48rYOZv17+n+xAssnU4YtYCW5iAzWuBFC5R6
         3YghDlVkh/Al9ZlIHSOrxYZ/YZjYFPNE1SUzVMMIeoWpB0nkQxvs9d5oYzf7eh0J41YS
         1rX4ldIDffrrRyAeWjS1PMwYevO9Ym79ItnqRatzZwKL6c+NeFD1ZYqzSVNZijPGZj9b
         dYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6y2X/vzwMwkxnQsLnLmCsH4darNYv3HaJ4Cu9dpQPXM=;
        b=iHUtsSHxKxy5tg7kvbgoCFANUJR++i/027hIP5IlbTP68uwAWC1yk4WgW/0ImrOYXJ
         hbqLKb1/7qX93CvBRbqkK4aeIx7ynPOlnxDK8/IeO/adyiCkFR0CZ9b8V1p4Y+jOsZ6C
         hHMrfAfhALQRVHcxMWWStNRqzFFUNquou7paF2Adj0vm8tGe3wM0VetWuKzSKBY7mTnG
         U0h1FO1Kt8N0Wul7sS+9Otq7JK33TjZyDd7E/hKp0IqznaODHI0sJq4z+bcK9oFmafsp
         r7AAEKB6RGkC+xBJ9BQrOv8Wygf+M843x5lV/fFfdg3MJg394wVxGuioxmMyGv+2IS99
         GHMQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXNVhMwGenFBdM73TkYBS+DUEDmji58xnZ1MZs4geQyPRiMVw6r
	dIMAe444h03ecgNdgc9T1c8=
X-Google-Smtp-Source: APXvYqwVeWieZ2GSncjmCFCl0zSIwiq5qOZeuzIQkSZ7cEsdGpSH/Lu044d6ny26w7m869mIRQOFxw==
X-Received: by 2002:aa7:c694:: with SMTP id n20mr66143114edq.95.1577638260243;
        Sun, 29 Dec 2019 08:51:00 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:385:: with SMTP id ss5ls10024774ejb.7.gmail; Sun, 29
 Dec 2019 08:50:59 -0800 (PST)
X-Received: by 2002:a17:906:939a:: with SMTP id l26mr63991613ejx.91.1577638259566;
        Sun, 29 Dec 2019 08:50:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577638259; cv=none;
        d=google.com; s=arc-20160816;
        b=ZormG/eQTewWYFdJah5w5QZVKA+TBFwm2YG7VmyO2hjq7RrjpLv0s1UfzxPGI02jjf
         FePa4bqv/yYUuiohpKoUyYj3y1sRDht/4JRxEN8wQSJFjzvHuGKyGLpquymtLhmS0Xg+
         0XoI//En9GmY0M3NHyZZP0Ik/8CVN1OVrhFdma9DwhKMHhpvkgTCnksOpcMyzTyONTbm
         xXaGLWxSFwpUvUNtriezfdopzZ4W/OXR+TO4Sla45oyTl6AEb/RwxqGkpquGcdFlUekq
         MTvtzw5KyS3idP0TEJFFoZlSZDFIIH7LMN9vO40DGkXZb+NMuxDCDAZVDeV2fz5+QnTQ
         0gXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=xRoVUsQI5Q18VLf01k2AB7xNjOHB+QcV3VfADjk/4KI=;
        b=BBSd4I+8ywcosvrOSoy74ccvkQPm1XUjGdMSVPoHRx+6XXJWg0GH3Q52ldPiw1UVt+
         ohL9Yj0+P/5Me85m+pSXgEb692JiWEbKrOMDc2PhuI3INuJ2dqqHbc8C8FI5p+WgS96x
         xAjDlbvyj93lTT0F0rPkvTuegD4MWHL8Q5fihdED3tzxfSWILiopxlJ1FQcDZgCzHZeC
         5+mnNnpELiorUYTf8DGRtAiYahB7nNhpBw0vqnrLff2l15b8uE/K4ryRnkwAmA3kI2Cx
         y71JS+WfDRktdmeHRi2ele7EjVAts8hjkZt6giIvjLZ/lI+7rGIGewlqZxbFIXH5rJXS
         YYEA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=UMHtL2fD;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id n21si1607781eja.0.2019.12.29.08.50.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 29 Dec 2019 08:50:59 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.2.196] ([84.61.93.39]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MeBPe-1j6y7A1daI-00PxNr; Sun, 29
 Dec 2019 17:50:58 +0100
Subject: Re: [jailhouse-images] qemu examples stalls to enable with -EIO
To: contact.thorsten@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <c6d8a14f-97c4-43f8-828d-679b08e14555@googlegroups.com>
 <4d491b38-28d8-a0ea-4cb1-1499957997bd@web.de>
 <590db4b2-f355-478c-83eb-fe2a3722739f@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <1244a8aa-25d4-b475-9371-681939ebae8d@web.de>
Date: Sun, 29 Dec 2019 17:50:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <590db4b2-f355-478c-83eb-fe2a3722739f@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SON/rt7wzY7Q9FRCyInzDi3+BVZfxjbPiaAklKo02FwoG68nnTL
 BkhDrw46b8cJ4z70Ha3Y92F4+3usTurOvI7VUrkesXG6LcZOcImfOcAYou2fGbTsKrHOv+u
 u+/4EzZrL2gvQZ45WtwvJz81ABGP9ZAYJl30CI2hqQjNt7iY5yRgadUwyuj2XY9q7xiupQ9
 vUnJDu3f1lbRO9ZLW/Axg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zBwxKTudsyY=:JeKZgfmHPwIUGvIxfC8ixp
 JywAV6En5+KythdRoxAsGs/BMnDNubfIspzphNeojoH9F4mKWft00yQPAU/WyB2/1kozqn20y
 t5lY1o4/+9X/Q8bWR5jRAAbtLnGtIVhAbpfeF83ZQ4+n5j3j/YV6R+A4hPuWeE0ZoGETIgIbg
 Hm+Xjsz7opAEIroWNuEW0D/p2ukoe+L8VSEa3fx+v/jfCgg4e5TfyTJ+LG2A/X9T8EvhRW3EE
 TJqnHY3r9l6KYiNT3Htd8yadUwGl/iAMxHlwPfihoQTg1wfheMVjTuBQqdJJBZgeczXNi+GoQ
 SJct/iQhOfhHloHi/4uvm+2YHieOluKI2WUNKTcQxu9qrL+ajjPGW/TLGV7zFi9KC9BU7ob+y
 dqWwTNUoF/AdJphIF45OQYQhxRfCYsJkRnl58fS/4T4+vf2m2BvBN4hLgE2eh4l3vcBYapeKq
 hGc+uRpbGZjX74d+tTOvaiW5kIC0B/O9KOH5At2VC9aB7gUlYQNMOfso3B7te0JtJvp0ArfUF
 OTegTy/MJb5DZl3WRqjozT2CxS1mlRs9zFIzk7P36QgJe7rPv8/sfl1vSSn4EUG533HGTM8eS
 BfsvHDSo45dET+3NhgCA8HIOjwSgI/vLHmgGNfoVTRC8i2YPCEYjYxzjT1St5mdKxHOp9ckP9
 uqTIX+WZzrwanIJXQ+yija9WKM6M7mxjX2o84neReL+1IQMc731AjbU6uvdQK15qcxpSTe5se
 cGxFB/mfRs6grAf1cYynXCluufdceGx4ONjgF41xqq3roqyfExKBKu8r67I2mL7SSSVTLgr/N
 rwP8aGVI933AOrV3BVTJLd01xXp+v/LrJeoprX+HkRL6OoiqZ+HFh4E9ELoOTcsU94FmrW3XD
 HZRR8sO/wRm484okynJESadz6OH6zPgq+wg/xj9OJ2doyDBrRp6P64jzMgzeoyIWUkT2gWNA4
 4JgmgpeKmVm2C1mb8ceFg+w06YTB1cI7M9JwYUZWkE+SUslauZKOshpFFSoEgt9X9zXI+kGCX
 T13rkp+fJoi0zIwGM0B+C4wpkJRhKBFRnk1MRyf6o9fDwI8Q5Hvjb3RKekW2JmXXz2w6m9usf
 K/2iJr4amAs7h+x3pFq4AM3iRL/MfdBhzgDuVkLo3+82olIYtzoD4514qVP7vCDFbv3yot9Dx
 vTu6jF3FkMkcSglQjuyWwgl+JYmYj+5MQx3dhxYEMF9GsaDq0jq6793wsSL8eWC/7G3AC9zre
 60uOG1DH/cSJPgvhnJV/neltRG3YL28uBINUDZa8NNpeY2aXqsfeenfMCcvg=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=UMHtL2fD;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 29.12.19 13:16, contact.thorsten@gmail.com wrote:
> Am Sonntag, 29. Dezember 2019 11:48:45 UTC+1 schrieb Jan Kiszka:
>
>     Are you using jailhouse-images master, ie. -cpu host,...? Or was this
>     -cpu kvm64?
>
>
> pure master, ie, "-cpu host..."
>
>     This may still be a limitation of the host CPU.
>
>
> quite convinced about that :) , after trying to solve/understand the
> mess about x2APIC on these processors for the last days (sidenote, I
> have to start my host system (see above) with kernel parameter nox2apic,
> because the up-to-date BIOS still forbids it. x2APIC is emulated by qemu)
>
>     Could you try "jailhouse hardware check" with this patch on the host?
>
>
> sure,
> reflects exactly what I found by fiddling in vmx.c:
> with default start-qemu.sh -> "XSAVES=C2=A0 MISSING" ... "Check FAILED!"
> with "-xsaves" added to qemu's -cpu param -> "XSAVES=C2=A0=C2=A0 missing
> (optional)" ... "Check passed!" (and it seems usable)
>
> jh_hw_chk_wPatch-xsaves.png
>
> jh_hw_chk_wPatch.png <about:invalid#zClosurez>

Actually, I'm more interested in the feature set of the host CPU, not
the one QEMU presents. I strongly suspect, though, that it will be
equivalent to what the guest sees in this regard.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1244a8aa-25d4-b475-9371-681939ebae8d%40web.de.
