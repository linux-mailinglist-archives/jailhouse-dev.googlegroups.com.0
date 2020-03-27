Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBBHL67ZQKGQE3X2DW5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D2319576F
	for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Mar 2020 13:45:56 +0100 (CET)
Received: by mail-lf1-x13f.google.com with SMTP id q4sf3713031lff.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Mar 2020 05:45:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585313156; cv=pass;
        d=google.com; s=arc-20160816;
        b=GSz4Y6Cd+RE4dF1rWbDVBdfiNqmNYYkkCmaKk+RB56XC4wvKRBhsxSQE9TvL8Aa25o
         2fc0A6t8YdN8pg5B+ARrIx1XsAunUPRlNebVIAYE3wD8lcGXxcIPWa2llAZvzpx8yUMG
         c5auP6rmqJlI3APjeSvPYoy47Kem3sUWDtBJ2FWeD5tmfCIl6CaDzTpk1q1o88X9J6xe
         vZmmZS/0PERaL09e6NAZHPPJlu9zifs8dC2knfZ7d0jdmDUWmohWOSYZ+akCuM4o+AFw
         JoYNM1yiyfx4za5dTRkaIzjqtFMwsE/j9rBYd8q0gj6lBITtgo5ioJ8/QVk8uX9ImR/a
         Nxjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=5LmbApediMMKg3BytnjR99SEnz8tdN8NpLe601yWL8E=;
        b=FWWAWBj+0ZaIRYFVgKlYn137DL13r7gcOHVpj7/ITcNp0oeAtkRpinc2q4Xh//jIpU
         dAtnCohBOg9lQiWuftyQPb48Ns5SRCnZrwZiBPhmvlOd9LoeHN7chzRV7gXdqYOgM7D7
         MxrA2gO420/HjU3peIvR3cqRD3WI81i6oJjAH4eMoz5feOCTRAKmPiFTzatfxKuPHkRQ
         eUiJUdcNWlmzxgeUdM+ziG6nFqTC31Rnn0y4wRpa0bLmijdNfr1NNyDElHJ9s9Xch5NP
         rreSuGY07vZZCbYXp21FV00tC/XiFfU8ItC8N2DCg4HMgMDdS/ChOWLUpsy+kNac63C9
         fwwQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=BZS9x8tg;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5LmbApediMMKg3BytnjR99SEnz8tdN8NpLe601yWL8E=;
        b=WG00H3B1HHWovHGWGF+3cPyxRuFoH5MRrcqxHTobLT0823jC6fkYM3zVbMmZV9c3gp
         Qdslk4QKvaCND+sahTKBguIIRxkrO5Tcf3Eq1LMOGcu43izBYYazraF0B+uEpkOoA3RO
         a29JGNgpraS6RMD3fgkpQH+fHK9LR/9jMoXQf/baxPPmk8fQuWaKrJRKm9/7ieA7kFA4
         LRzufcUCTd3RsUTEa1OgjyoWo/aEOZiMxwa/+Jr+ymqxyodhjmDVIovQ9p2BkbKoDM9b
         oF0tChklAv9Njfady6j4qTVrB342vLMzetnDYEBcthZM3jHCU3wmzJ7qxQ06rKE+ZWjN
         CT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=5LmbApediMMKg3BytnjR99SEnz8tdN8NpLe601yWL8E=;
        b=cpnRlVVwO4HCItlePKDDKMFItvyil6h+j8LNLoIeXH8smiAcntaJdJ16fMd/8Gywfh
         bAJQwQdwyzlnMhhDW8G7Y/VnDp0KPc/sfTfkQLtsHXhpgxzp/6oQUY1tNFuvJCHA6rc/
         iVKGtBvVsv1UuFkpKp1vgbl9sY9zmxJWN3O/kKsGhoidryn1IbFrNANaZcaUQRZPhDN4
         v4d+1PaIkqMvp+g7qTNo/OfSg+/YVeI096VRr922AfN2OJjoI4YnnpB3b1mgsNoXSOu3
         sBHazQ7CSpoHtzlK/Rzi0CESUZqG+vx5kiPTPYDql8Jp69BlP406TJrxa003bY5V08/1
         YR+Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuZW9mdCd31S+B2gy2wj61lc1rZR2U5y+yQSOj/L3RfasA+VOXBg
	RwGvFabDoxeZikVYTvZBNMk=
X-Google-Smtp-Source: APiQypLrWanD6oJbQpkIiFySO8CkS+4FzcN0zh5vOirMSglBcVcAvMhucQEbuvvQ5k0l/Bbg/iNdng==
X-Received: by 2002:a05:651c:404:: with SMTP id 4mr2687913lja.281.1585313156173;
        Fri, 27 Mar 2020 05:45:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:91d5:: with SMTP id u21ls2223495ljg.5.gmail; Fri, 27 Mar
 2020 05:45:55 -0700 (PDT)
X-Received: by 2002:a2e:905a:: with SMTP id n26mr4598770ljg.58.1585313155435;
        Fri, 27 Mar 2020 05:45:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585313155; cv=none;
        d=google.com; s=arc-20160816;
        b=sKg32OYGo3E5hC038ucQ/o/vhzCA5bq5rxg48pbX7DPcTiS+cyOvEvg2l+WVQOHzun
         PQvhvveeHkypxKl0O9zi7IujghLiw+AAhGlVJzbD349ATXZN5snpV59YtOc9b/yS+LxC
         EZqgXrdQd1Wlqoh9WJdpdpJP45l6XhZOaYunh+U3WvUxzuP3f7V6ZJvIgFpRQ9DE1hQS
         Uma17eCqX11nx7dwFLjLUuxXn72NJhhsfKnYXn+fyK2Gw/B7Vl9wEPU868dk/gzjIf75
         9JAoN5kcarBzU7Gz85axLnvRPVAJyCQrqLrqdJWq5RTfHqSkIdSvSqSDjzzRekt2iwdy
         lnbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=gkpacZYsZ4detDWm0XmNr8SxhGSit2VIB+R/njwf0AY=;
        b=PJ5MBox8iTAsYB4V2dCpiyzXRoP3+eixNiim045L7yAnTzinkG9RiwsmqrqyuEW+ud
         7t0Vlm/oWiTHG6zCykXf+H+yNNqgV9+DKNXt/zYryl7nVGhj/QiTrDlc+mpQBOkutzoO
         HBITx7ZawaselzDOOv5RPuBd4kwOoDtt+3kMDtOfrIGJSQtKfD1iTIPeSVHyH1W/IldT
         /dPgtwNMwUx3WFJ0sJaCjKcz6ONmRhNdkHw9XbLrqRsOF303yOSAkStp8SY2XpPMcT8g
         X4BOF/aBTLmYMsnIBk5KCc33RBnkyBly9CHra81Jr622fSQ+4qj5kqZf0zJItYYjzC3f
         AH6Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=BZS9x8tg;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id q13si359633lfo.3.2020.03.27.05.45.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 05:45:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M95ET-1j5PFU2s1d-00CTPL; Fri, 27
 Mar 2020 13:45:53 +0100
Subject: Re: [RFC] Linux-less boot
To: Angelo Ruocco <angelo.ruocco.90@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Cc: Marco Solieri <marco.solieri@unimore.it>,
 Luca Miccio <206497@studenti.unimore.it>, Alice Guo <alice.guo@nxp.com>
References: <CADiTV-1QiRhSWZnw+kHhJMO-BoA4sAcOmTkQE7ZWbHkGh3Jexw@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <f97e2fbd-11cf-d39a-9c6c-a2310a480b2e@web.de>
Date: Fri, 27 Mar 2020 13:45:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CADiTV-1QiRhSWZnw+kHhJMO-BoA4sAcOmTkQE7ZWbHkGh3Jexw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:eBzIOewZdb9Mp4TVCo45UT8GmDCfOT0Xw+/OaL1RqttgwgJo1hX
 NMjyrBrMELqMFtj0WrMiTHZlWB9rE345K5wmRHV4lFFLPvMCXV6MaiKM4b7iRTjJfdOy1+L
 PCtLjYW3RjWnmCBxe+q0FbSGGNq2G1RkbSP2Y7fssgWSmDjQDFeWxQBTyuzisJc4fVnXhwv
 Kz4k8DABwcA7PoE9nnUFg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1NX0Tk1YqlA=:OdC1KjgNFvT1wce3yCfAc+
 i5On2ybxMLK/0+kWsuqqzQGU7x5sto6jeG4UImspf3q5znyCI9BDdBBSQ1Qa5nzlzJJE9tTZu
 RtGuEMhhjniYTs9afiRTv8BTgabnpxZTlxlbVsQ6yTgbQ3vvySHKUu3rJF7VAnIr3sTe2Efxt
 lP+SXZ/t/+ooU0P39YSeM/HFVGXhkRYDuZOSAkL3BaGb5dJ0AbRlBzh6/AfojmdBdcdLd2a/J
 sJ/6sf9c5ZZJxtxz3FJeWVnuR79frqaqJZ8ADCuiFgeNpr+oK2IMhgKRTpUBXr1czT7dAUali
 IH/LuLOQeLAEbmnAYHcRWlVNCa0ERy5ogcn+ePveLBEfsl71Bcfipee2kkLCibJd7ssRAOkOL
 DInV30EfdwwMGJ8JHF2js0szNlNItwgIe3377pHLKDJfhvjlpE8CyrxsckrBTk4cxJOnwDylg
 AObRsVrzD2Sq9Nb4WT/MxnwG3a/S8Q1sX+4ZoBTipReEnOE9jSn2cByDcKVpqOYLtUPvBE1ta
 /DvMaY/XE5aSGdMyxHD03k+OWc+1fPbD5RpHdQ6f5mc2jBcbXPLyVSe/83xUJb1TflsM5aTRM
 mtOnAkV/MEY79D5r12OVpFGKhdAf/g5kY+Se3gJb3Xot8JQso8rNBZMHE3/ezXqmbCwfzvAx+
 N88p6UcOE9mGV+JZUOShy+gUMB47iI89i81uGn4zeNeeYZy0wbFgBRpHVtmFDqXsccEq4xoQe
 WYX8ZDjDfnipAOwqOe7wU8KKCS8engg962GDlc3D0e6tVg2f4077RknkydndB8+ifKB19h/r+
 FZAvdYO7ykJiq5GRse45JlqN40QEW144SMH7+8HSRD6+YNZXe3Ag08s2/PAs0+T6eLPtrn9K7
 fNh5oZ71Ue7xehyOXKbcCpkyLTCVEZUT7tQ0ViVxY9mCzWwZgHshJK0KzyrhyKcGv9vH5janZ
 ULFV2pAY0H99Lse5YBqPFdtf0BfHDy5dvhfqrcKE5POZvOYUQkhP9Fwe+0I92312qvHsY8vCo
 8LEEn4OpJjdAkg8CUGOF/AEy/ofkwMkIJ70I5SrbDlGgyLvmNE6nGRqSkmOGiJcdX5Ag1jBmB
 tq/7iQk1fnxN2rtAdqyh9St9c1YgBZdNk8+H97RRHROM+O4h6MxRoQBVhfklev4vj0eFth+LF
 mEpxClg8QREHUyUTaMaT9R8kIKu9fc8fukhoSyrpYrLw5SM003zP4lhVvHokLI4CoBYdR0D4o
 ktWW74yh9Up69ijqK
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=BZS9x8tg;       spf=pass
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

On 27.03.20 12:41, Angelo Ruocco wrote:
> Hi Jan, Peng, all,
>
> We currently have a better understanding of Peng's work [1] and manage
> to somewhat reproduce his results on another NXP board, the IMX8QM.
> Since you showed interest in this, we would like to start implement
> something a bit more portable and user-friendly.
>
> In this regard, I would like to share some design choices:
> - Jailhouse image stays more or less the same, all the code is added
> into a loader, expanding Peng's work to make it more portable (across
> Arm v8 boards for now) and generic. The loader will boot and init
> everything that jailhouse and the inmates need. Without the loader
> jailhouse can be started exactly like it was before.

That is at least the best first step. We can still look into potential
consolidation (at the price of deviating the hypervisor startup) later
on. One area would be the hand-over mode of the CPUs (EL2 rather than
EL1 + EL2-stub).

> - The loader is platform-specific, and thus it's necessary, at
> compile-time, to have a parameter that specifies the target (something
> like `BOOT=` or `TARGET=`), using the root-cell information to fill
> the correct addresses and compile only the necessary drivers. Without
> the parameter, the loader is not compiled.

What would make the loader platform specific beyond what could be
configured and, thus, runtime selected by the root-cell config (or even
a device tree)?

> - There is going to be a "sync" function at some point, probably when
> loading the module, that can update the status of jailhouse so that
> the cells created at boot time are controllable. The idea is to have
> the same situation as if jailhouse was started with the `enable`.

Yes, we could make the used cell configurations available to the Linux
driver in order to virtually replay (for its internal state) what the
loader already did.

>
> Finally, we would also like to hear from Peng, to understand his
> current plan so that we don't step in each other's toes.
>
> [1] https://groups.google.com/forum/#!topic/jailhouse-dev/IZEFz-e2lh4
>
> Angelo
>

Thanks,
Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f97e2fbd-11cf-d39a-9c6c-a2310a480b2e%40web.de.
